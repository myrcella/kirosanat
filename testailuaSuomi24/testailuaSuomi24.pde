import wordcram.*;
import processing.video.*;

Capture cam;
//The brightest pixels in the original video, not mirrowed!
float brightestX = 0;
float brightestY = 0;

int radiusOfInner = 200;
int radiusOfOuter = height/2-80;
int selectedHour = 0;
int maxValue = 200;

boolean drawCurses = true;

void setup() {
  size(800, 800);
  background(255);
  //cam = new Capture(this, width, height);
  //cam.start();
  stroke(0);
  strokeWeight(2);
  noFill();
  noLoop();
}

void draw() {
  background(255);
  pushMatrix();
  translate(width/2, height/2);
  rotate(PI + (selectedHour * (PI / 12))); // rotates according to the selected Hour
  ellipse(0, 0, radiusOfOuter*2, radiusOfOuter*2); //outer circle
  ellipse(0, 0, radiusOfInner*2, radiusOfInner*2); //inner circle

  //Total amount of words
  beginShape();
  for (int i=0; i<words.size (); i++) {
    curveVertex(sin((TWO_PI/words.size())*i)*(scaleValue(words.get(i))+radiusOfInner), cos((TWO_PI/words.size())*i)*(scaleValue(words.get(i))+radiusOfInner));
    stroke(255, 0, 0);
    ellipse(sin((TWO_PI/words.size())*i)*(scaleValue(words.get(i)+radiusOfInner)), cos((TWO_PI/words.size())*i)*(scaleValue(words.get(i))+radiusOfInner), 6, 6);
    stroke(0);
  }
  for (int i=0; i<3; i++) {
    curveVertex(sin((TWO_PI/words.size())*i)*(scaleValue(words.get(i))+radiusOfInner), cos((TWO_PI/words.size())*i)*(scaleValue(words.get(i))+radiusOfInner));
  }
  endShape();

  //Total amount of curses
  beginShape();
  for (int i=0; i<curses.size (); i++) {
    curveVertex(sin((TWO_PI/curses.size())*i)*(scaleValue(curses.get(i))+radiusOfInner), cos((TWO_PI/curses.size())*i)*(scaleValue(curses.get(i))+radiusOfInner));
    stroke(255, 0, 0);
    ellipse(sin((TWO_PI/curses.size())*i)*(scaleValue(curses.get(i))+radiusOfInner), cos((TWO_PI/curses.size())*i)*(scaleValue(curses.get(i))+radiusOfInner), 6, 6);
    stroke(0);
  }
  for (int i=0; i<3; i++) {
    curveVertex(sin((TWO_PI/curses.size())*i)*(scaleValue(curses.get(i))+radiusOfInner), cos((TWO_PI/curses.size())*i)*(scaleValue(curses.get(i))+radiusOfInner));
  }
  endShape();
  popMatrix();

  WordCram wordcram = new WordCram(this)
    .fromWords(wordArray)
    .withPlacer(middle());
  wordcram.drawAll();

} 


void keyReleased() {
  if (key == 'r') {
    if(selectedHour<24){
    selectedHour += 1;
    } else {
    selectedHour = 0;
    }
    
    redraw();
  }
}

int scaleValue(int number) {
  return number/maxValue*(radiusOfOuter-radiusOfInner);
}

