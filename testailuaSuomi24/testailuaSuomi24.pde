import wordcram.*;

int radiusOfInner = 300;
boolean drawCurses = true;
int selectedHour = 0;

void setup() {
  size(1000, 1000);
  background(255);
  stroke(0);
  strokeWeight(2);
  noFill(); 
}

void draw() {
  pushMatrix();
  translate(width/2, height/2);
  rotate(PI);
  ellipse(0, 0, width-10, height-10); //outer circle
  ellipse(0, 0, radiusOfInner*2, radiusOfInner*2); //inner circle

  //Total amount of words
  beginShape();
  for (int i=0; i<words.size (); i++) {
    curveVertex(sin((TWO_PI/words.size())*i)*(words.get(i)+radiusOfInner), cos((TWO_PI/words.size())*i)*(words.get(i)+radiusOfInner));
    stroke(255, 0, 0);
    ellipse(sin((TWO_PI/words.size())*i)*(words.get(i)+radiusOfInner), cos((TWO_PI/words.size())*i)*(words.get(i)+radiusOfInner), 6, 6);
    stroke(0);
  }
  for (int i=0; i<3; i++) {
    curveVertex(sin((TWO_PI/words.size())*i)*(words.get(i)+radiusOfInner), cos((TWO_PI/words.size())*i)*(words.get(i)+radiusOfInner));
  }
  endShape();

  //Total amount of curses
  beginShape();
  for (int i=0; i<curses.size (); i++) {
    curveVertex(sin((TWO_PI/curses.size())*i)*(curses.get(i)+radiusOfInner), cos((TWO_PI/curses.size())*i)*(curses.get(i)+radiusOfInner));
    stroke(255, 0, 0);
    ellipse(sin((TWO_PI/curses.size())*i)*(curses.get(i)+radiusOfInner), cos((TWO_PI/curses.size())*i)*(curses.get(i)+radiusOfInner), 6, 6);
    stroke(0);
  }
  for (int i=0; i<3; i++) {
    curveVertex(sin((TWO_PI/curses.size())*i)*(curses.get(i)+radiusOfInner), cos((TWO_PI/curses.size())*i)*(curses.get(i)+radiusOfInner));
  }
  endShape();
  popMatrix();

  //Wordcloud
  if (drawCurses) {
    WordCram wordcram = new WordCram(this)
      .fromWords(wordArray)
      .withPlacer(middle());
    wordcram.drawAll();
    drawCurses=false;
  }
} 

