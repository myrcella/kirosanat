void setup() {
  size(1000, 1000);
  background(255);
  stroke(0);
  strokeWeight(2);
  noFill();
}

int[] totalWords = new int[] {
  100, 180, 100, 80, 120, 100, 190, 170, 110, 70, 180, 140,  100, 180, 100, 80, 120, 100, 190, 170, 110, 70, 180, 140
};
IntList words = new IntList(totalWords);
int[] totalCurses = new int[] {
  10, 20, 7, 25, 5, 2, 27, 5, 25, 30, 18, 12,10, 20, 7, 25, 5, 2, 27, 5, 25, 30, 18, 12
};
IntList curses = new IntList(totalCurses);
int radiusOfInner = 300;

void draw() {
  translate(width/2, height/2);
  rotate(PI);
  ellipse(0, 0, width-10, height-10); //outer circle
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
  ellipse(0, 0, radiusOfInner*2, radiusOfInner*2); //inner circle
} 

