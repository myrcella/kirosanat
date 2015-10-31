import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Calendar;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.io.FileWriter;
import java.io.IOException;
import java.util.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;


public class Suomi24Reader {

  private String[] curseArray = {"vittu", "saatana", "helvetti", "jumalauta", "perkele", "paska", "hemmetti", "helkkari", "hitto", "saakeli"};
  private String[] ethnicArray = {"neekeri", "mutiainen", "manne", "kinkki", "vinosilmä", "mutakuono"};
  private String[] sexualArray = {"homo", "huora", "lutka", "narttu", "bitch","hutsu"};
  private String[] genericArray = {"dorka", "kusipää", "paskapää", "nynny", "läski", "idiootti", "imbesilli", "luuseri", "mulkku", "nynnerö","aivokääpiö"  };
  private Map<Integer, Map<String, Integer>> cursesByTime = new HashMap<Integer, Map<String, Integer>>();
  private Map<Integer, Map<String, Integer>> ethnicsByTime = new HashMap<Integer, Map<String, Integer>>();
  private Map<Integer, Map<String, Integer>> sexualsByTime = new HashMap<Integer, Map<String, Integer>>();
  private Map<Integer, Map<String, Integer>> genericsByTime = new HashMap<Integer, Map<String, Integer>>();
  
  private  Map<Integer, ArrayList<Word>> cursesAsPairs =  new HashMap<Integer, ArrayList<Word>>();
  private  Map<Integer, ArrayList<Word>> ethnicsAsPairs = new HashMap<Integer, ArrayList<Word>>();
  private  Map<Integer, ArrayList<Word>> sexualsAsPairs = new HashMap<Integer, ArrayList<Word>>();
  private  Map<Integer, ArrayList<Word>> genericsAsPairs = new HashMap<Integer, ArrayList<Word>>();
  
  private Integer[] totalWords = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
  private Integer[] totalCurses = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
  private Integer[] totalEthnics = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
  private Integer[] totalSexuals = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
  private Integer[] totalGenerics = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};

  public Suomi24Reader() {
    Long start = System.nanoTime();
    init();
    processInputfile(cursesByTime); //At least my computer was faster when I called this method four times than when processing every map at once.
    processInputfile(ethnicsByTime);
    processInputfile(sexualsByTime);
    processInputfile(genericsByTime);
    calculateTotalCurses();
    makeWordMaps();
  }

  public void init() {
    Map <String, Integer> curses = new HashMap<String, Integer>();
    Map <String, Integer> ethnics = new HashMap<String, Integer>();
    Map <String, Integer> sexuals = new HashMap<String, Integer>();
    Map <String, Integer> generics = new HashMap<String, Integer>();
    for(String curse: curseArray) {
      curses.put(curse, 0);
    }
    for(String curse: ethnicArray) {
      ethnics.put(curse, 0);
    }
    for(String curse: sexualArray) {
      sexuals.put(curse, 0);
    }
    for(String curse: genericArray) {
      generics.put(curse, 0);
    }
    for(Integer i = 0; i < 24; i++) {
      Map <String, Integer> newCurses = new HashMap<String, Integer>();
      Map <String, Integer> newEthnics = new HashMap<String, Integer>();
      Map <String, Integer> newSexuals = new HashMap<String, Integer>();
      Map <String, Integer> newGenerics = new HashMap<String, Integer>();
      newCurses.putAll(curses);
      newEthnics.putAll(ethnics);
      newSexuals.putAll(sexuals);
      newGenerics.putAll(generics);
      cursesByTime.put(i, newCurses);
      ethnicsByTime.put(i, newEthnics);
      sexualsByTime.put(i, newSexuals);
      genericsByTime.put(i, newGenerics);
      cursesAsPairs.put(i, new ArrayList<Word>());
      ethnicsAsPairs.put(i, new ArrayList<Word>());
      sexualsAsPairs.put(i, new ArrayList<Word>());
      genericsAsPairs.put(i, new ArrayList<Word>());
      
    }
  }

  private void processInputfile (Map<Integer, Map<String, Integer>> group) {
    try {
      //File dir = new File("E:/Suomi24/2015/01");
      File dir = new File("/home/saga/Suomi24_2015_10_01/2015/01"); //("/home/saga/Suomi24_2015_10_01/2015/01")
      File[] directoryListing = dir.listFiles();
      if (directoryListing != null) {
        Integer count = 0;
        for (File child : directoryListing) {

          FileReader reader = new FileReader(child.getPath());
          JSONParser jsonParser = new JSONParser();
          JSONObject jsonObject = (JSONObject) jsonParser.parse(reader);
          JSONObject originalData = (JSONObject)jsonObject.get("data");
          parseText(group, originalData);
          count++;
          System.out.println("Parsed file:   " + child.getPath() + "    was file number:   " + count);
        }
      }
    } catch (FileNotFoundException e) {
      e.printStackTrace();
    } catch (IOException e) {
      e.printStackTrace();
    } catch (ParseException e) {
      e.printStackTrace();
    }


  }

  private void parseText (Map<Integer, Map<String, Integer>> group, JSONObject data) {
    Calendar calendar = Calendar.getInstance();
    Long time = (Long) data.get("created_at");
    calendar.setTimeInMillis(time);
    Integer timeAsInteger = calendar.get(Calendar.HOUR_OF_DAY);
    String[] originalText = ((String) data.get("body")).replace("<p>", " ").split(" "); 
    for(Integer i = 0; i < originalText.length; i++) {
      totalWords[timeAsInteger] += 1;
      if(group.get(timeAsInteger).containsKey(originalText[i].toLowerCase())) {  
        group.get(timeAsInteger).put(originalText[i].toLowerCase(), group.get(timeAsInteger).get(originalText[i].toLowerCase()) + 1);
      }
    }
    if (data.containsKey("comments")) {
      JSONArray comments = (JSONArray) data.get("comments");
      for(Integer i = 0; i < comments.size(); i++) {
        JSONObject comment = (JSONObject) comments.get(i);
        parseText(group, comment);
      }
    }
  }

  public void calculateTotalCurses() {
    for(Integer i= 0; i < 24; i++) {
      Iterator<Integer> curses = cursesByTime.get(i).values().iterator();
      while(curses.hasNext()) {
        totalCurses[i] += curses.next();
      }
      Iterator<Integer> ethnics = ethnicsByTime.get(i).values().iterator();
      while(ethnics.hasNext()) {
        totalEthnics[i] += ethnics.next();
      }
      Iterator<Integer> sexuals = sexualsByTime.get(i).values().iterator();
      while(sexuals.hasNext()) {
        totalSexuals[i] += sexuals.next();
      }
      Iterator<Integer> generics = genericsByTime.get(i).values().iterator();
      while(generics.hasNext()) {
        totalGenerics[i] += generics.next();
      }
    }
  }

  public void makeWordMaps() {
    for(Integer i = 0; i < 24; i++) {
      for(String key: cursesByTime.get(i).keySet()) {
        if(cursesByTime.get(i).get(key) > 0) {
           cursesAsPairs.get(i).add(new Word(key, cursesByTime.get(i).get(key)));
        }
      }
      for(String key: ethnicsByTime.get(i).keySet()) {
        if(ethnicsByTime.get(i).get(key) > 0) {
          ethnicsAsPairs.get(i).add(new Word(key, ethnicsByTime.get(i).get(key)));
        }
      }
      for(String key: sexualsByTime.get(i).keySet()) {
        if(sexualsByTime.get(i).get(key) > 0) {
          sexualsAsPairs.get(i).add(new Word(key, sexualsByTime.get(i).get(key)));
        }
      }
      for(String key: genericsByTime.get(i).keySet()) {
        if(genericsByTime.get(i).get(key) > 0) {
          genericsAsPairs.get(i).add(new Word(key, genericsByTime.get(i).get(key)));
        }
      }
    }
  }
  
  public Map<Integer, ArrayList<Word>> getCurses() {
    return cursesAsPairs;
  }
  
  public Map<Integer, ArrayList<Word>> getEthnics() {
    return ethnicsAsPairs;
  }
  
  public Map<Integer, ArrayList<Word>> getSexuals() {
    return sexualsAsPairs;
  }
  
  public Map<Integer, ArrayList<Word>> getGenerics() {
    return genericsAsPairs;
  }
  
  public Integer[] getTotalWords() {
    return totalWords; 
  }
  
  public Integer[] getTotalCurses() {
    return totalCurses; 
  }
  
  public Integer[] getTotalEthnics() {
    return totalEthnics; 
  }
  
  public Integer[] getTotalSexuals() {
    return totalSexuals; 
  }
  
  public Integer[] getTotalGenerics() {
    return totalGenerics; 
  }

}

