package studio4;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.io.FileWriter;
import java.io.IOException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import javafx.util.Pair;



public class Suomi24Reader {

	private String[] curseArray = {"vittu", "saatana", "v*ttu", "stna", "helvetti", "perse", "jumalauta", "perkele", "paska", "hemmetti", "helkkari", "hitto", "saakeli"};
	private String[] ethnicArray = {};
	private String[] sexualArray = {"homo", "huora", "lutka", "narttu", "bitch",};
	private String[] genericArray = {"", "", "",};
	private Map<Integer, Map<String, Integer>> cursesByTime = new HashMap<Integer, Map<String, Integer>>();
	private Map<Integer, Map<String, Integer>> ethnicsByTime = new HashMap<Integer, Map<String, Integer>>();
	private Map<Integer, Map<String, Integer>> sexualsByTime = new HashMap<Integer, Map<String, Integer>>();
	private Map<Integer, Map<String, Integer>> genericsByTime = new HashMap<Integer, Map<String, Integer>>();
	
	private ArrayList<Pair> cursesAsPairs = new ArrayList<Pair>();
	private ArrayList<Pair> ethnicsAsPairs = new ArrayList<Pair>();
	private ArrayList<Pair> sexualsAsPairs = new ArrayList<Pair>();
	private ArrayList<Pair> genericsAsPairs = new ArrayList<Pair>();
	
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
		System.out.println(((double)((System.nanoTime() - start)/1000000000.0)));
		makePairMaps();
		System.out.println(((double)((System.nanoTime() - start)/1000000000.0)));
		for (Integer key: cursesByTime.keySet()) {
			//System.out.println(totalCurses[key]);
			//System.out.println(cursesAsPairs.get(key).word);
				System.out.println(totalWords[key]);
				//	System.out.println(key + "    Enjoy:    " + cursesByTime.get(key));
		}

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
		for(int i = 0; i < 24; i++) {
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
		}//{ ("Hello", 100), ("WordCram", 60)};
	}

	public void getWordsByTime(String group) {
		Integer totalWordCount = 0;
		switch (group) {
		case "curses":
			processInputfile(cursesByTime);
			break;
		case "ethnics":
			processInputfile(ethnicsByTime);
			break;
		case "sexuals":
			processInputfile(sexualsByTime);
			break;
		case "generics":
			processInputfile(genericsByTime);
			break;
		default:
			break;
		}

	}

	private void processInputfile (Map<Integer, Map<String, Integer>> group) {
		try {
			File dir = new File("E:/Suomi24/2015/01");
			//File dir = new File("src/testresources");
			File[] directoryListing = dir.listFiles();
			if (directoryListing != null) {
				int count = 0;
				for (File child : directoryListing) {

					FileReader reader = new FileReader(child.getPath());
					JSONParser jsonParser = new JSONParser();
					JSONObject jsonObject = (JSONObject) jsonParser.parse(reader);
					JSONObject originalData = (JSONObject)jsonObject.get("data");
					parseText(group, originalData);
					count++;
					//System.out.println("Parsed file:   " + child.getPath() + "    was file number:   " + count);
				}
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


	}

	private void parseText (Map<Integer, Map<String, Integer>> group, JSONObject data) {
		Calendar calendar = Calendar.getInstance();
		Long time = (Long) data.get("created_at");
		calendar.setTimeInMillis(time);
		Integer timeAsInteger = calendar.get(Calendar.HOUR_OF_DAY);
		//		System.out.println(timeAsInteger);
		//		System.out.println((String) data.get("body"));
		String[] originalText = ((String) data.get("body")).replace("<p>", " ").split(" "); 
		for(int i = 0; i < originalText.length; i++) {
			totalWords[timeAsInteger] += 1;
			if(group.get(timeAsInteger).containsKey(originalText[i].toLowerCase())) {	
				group.get(timeAsInteger).put(originalText[i].toLowerCase(), group.get(timeAsInteger).get(originalText[i].toLowerCase()) + 1);
			}
		}
		if (data.containsKey("comments")) {
			JSONArray comments = (JSONArray) data.get("comments");
			for(int i = 0; i < comments.size(); i++) {
				JSONObject comment = (JSONObject) comments.get(i);
				parseText(group, comment);
			}
		}
	}

	public void calculateTotalCurses() {
		for(int i= 0; i < 24; i++) {
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

	public void makePairMaps() {
		for(int i = 0; i < 24; i++) {
			for(String key: cursesByTime.get(i).keySet()) {
				cursesAsPairs.add(new Pair(key, cursesByTime.get(i).get(key)));
			}
			for(String key: ethnicsByTime.get(i).keySet()) {
				ethnicsAsPairs.add(new Pair(key, ethnicsByTime.get(i).get(key)));
			}
			for(String key: sexualsByTime.get(i).keySet()) {
				sexualsAsPairs.add(new Pair(key, sexualsByTime.get(i).get(key)));
			}
			for(String key: genericsByTime.get(i).keySet()) {
				genericsAsPairs.add(new Pair(key, genericsByTime.get(i).get(key)));
			}
		}
	}
	
	public static void main(String[] args) {
		new Suomi24Reader();
	}
}
