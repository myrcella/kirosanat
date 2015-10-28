/*
Sininen(11, 95, 197)
 Vihreä(103, 194, 39)
 Vaaleansininen(117, 171, 226)
 Harmaa(207, 207, 207)
 Valkoinen(255, 255, 255)
 */

void drawTotalWords() {
  //Total amount of words
  stroke(color(103, 194, 39));
  beginShape();
  for (int i=0; i<words.size (); i++) {
    curveVertex(sin((TWO_PI/words.size())*i)*(scaleValue(words.get(i))+radiusOfInner), cos((TWO_PI/words.size())*i)*(scaleValue(words.get(i))+radiusOfInner));
  }
  for (int i=0; i<3; i++) {
    curveVertex(sin((TWO_PI/words.size())*i)*(scaleValue(words.get(i))+radiusOfInner), cos((TWO_PI/words.size())*i)*(scaleValue(words.get(i))+radiusOfInner));
  }
  endShape();
  stroke(0);
}

void drawTotalCurses() {
  //Total amount of curses
  fill(color(117, 171, 226));
  stroke(color(117, 171, 226));
  beginShape();
  for (int i=0; i<curses.size (); i++) {
    curveVertex(sin((TWO_PI/curses.size())*i)*(scaleValue(curses.get(i))+radiusOfInner), cos((TWO_PI/curses.size())*i)*(scaleValue(curses.get(i))+radiusOfInner));
  }
  for (int i=0; i<3; i++) {
    curveVertex(sin((TWO_PI/curses.size())*i)*(scaleValue(curses.get(i))+radiusOfInner), cos((TWO_PI/curses.size())*i)*(scaleValue(curses.get(i))+radiusOfInner));
  }
  endShape();
  stroke(0);
  noFill();
}

void drawWordCloud() {
  WordCram wordcram = new WordCram(this)
    .fromWords(wordArray)
      .withColors(color(11, 95, 197))
        .withPlacer(middle());
  wordcram.drawAll();
}

void drawDetails() {
  noFill();
  strokeWeight(3);
  stroke(140);
  fill(140);
  triangle(dimension/2-8, 60, dimension/2+8, 60, dimension/2, dimension/2-radiusOfInner+40); //voi olla myös 80 alimman pisteen y
  strokeWeight(2);
  textSize(32);
  text(selectedHour+":00", dimension/2-25, 45); 
  textSize(20);
  fill(color(103, 194, 39));
  text("Sanoja: "+words.get(selectedHour), dimension-200, 45); 
  fill(color(117, 171, 226));
  text("Kirosanoja: "+curses.get(selectedHour), dimension-200, 75); 
  noFill();
}

void drawCircles() {
  stroke(color(207, 207, 207));
  strokeWeight(1);
  ellipse(0, 0, radiusOfOuter*2, radiusOfOuter*2); //outer circle
  fill(color(207, 207, 207));
  for (int i=0; i<24; i++) {
    ellipseMode(CENTER);
    ellipse(sin((TWO_PI/24)*i)*radiusOfOuter, cos((TWO_PI/24)*i)*radiusOfOuter, 5,5);
  }
  fill(255);
  noStroke();
  ellipse(0, 0, radiusOfInner*2, radiusOfInner*2); //inner circle
  stroke(0);
  strokeWeight(2);
}

void drawBackground() {
background(color(11*selectedHour, 95*selectedHour, 197*selectedHour));
}

int scaleValue(int number) {
  return round(((float)number/(float)maxValue)*((float)radiusOfOuter-(float)radiusOfInner));
}

