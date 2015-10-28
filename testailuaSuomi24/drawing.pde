void drawTotalWords() {
  //Total amount of words
  beginShape();
  for (int i=0; i<words.size (); i++) {
    curveVertex(sin((TWO_PI/words.size())*i)*(scaleValue(words.get(i))+radiusOfInner), cos((TWO_PI/words.size())*i)*(scaleValue(words.get(i))+radiusOfInner));
    stroke(255, 0, 0);
    ellipse(sin((TWO_PI/words.size())*i)*(scaleValue(words.get(i))+radiusOfInner), cos((TWO_PI/words.size())*i)*(scaleValue(words.get(i))+radiusOfInner), 6, 6);
    stroke(0);
  }
  for (int i=0; i<3; i++) {
    curveVertex(sin((TWO_PI/words.size())*i)*(scaleValue(words.get(i))+radiusOfInner), cos((TWO_PI/words.size())*i)*(scaleValue(words.get(i))+radiusOfInner));
  }
  endShape();
}

void drawTotalCurses() {
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
}

void drawWordCloud() {
    WordCram wordcram = new WordCram(this)
    .fromWords(wordArray)
    .withPlacer(middle());
  wordcram.drawAll();
}

void drawDetails() {
  background(255);
  fill(0);
  triangle(dimension/2-8, 40, dimension/2+8, 40, dimension/2, 80);
  textSize(30);
  text(selectedHour+":00", dimension/2-25, 30); 
  textSize(20);
  text("Sanoja: "+words.get(selectedHour), dimension-200, 30); 
  text("Kirosanoja: "+curses.get(selectedHour), dimension-200, 60); 
  noFill();
}

void drawCircles() {
  ellipse(0, 0, radiusOfOuter*2, radiusOfOuter*2); //outer circle
  ellipse(0, 0, radiusOfInner*2, radiusOfInner*2); //inner circle
}


