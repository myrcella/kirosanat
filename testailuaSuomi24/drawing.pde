/*
Sininen(11, 95, 197)
 Vihreä(103, 194, 39)
 Vaaleansininen(117, 171, 226)
 Harmaa(207, 207, 207)
 Valkoinen(255, 255, 255)
 
 sininen (124, 175, 250)
 vihreä (178, 223, 147)
 vaal.sininen (188, 225, 255)
 harmaa (225, 225, 225)
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
  fill(color(188, 225, 255));
  stroke(color(188, 225, 255));
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
      .withColors(color(124, 175, 250))
        .withPlacer(middle());
  wordcram.drawAll();
}

void drawDetails() {
  noFill();
  strokeWeight(3);
  stroke(200);
  fill(200);
  triangle(widthX/2-8, 90, widthX/2+8, 90, widthX/2, dimension/2-radiusOfInner+50); //voi olla myös 80 alimman pisteen y
  strokeWeight(2);
  textSize(32);
  text(selectedHour+":00", widthX/2-25, 60); 
  textSize(20);
  fill(color(178, 223, 147));
  text("SANOJA: "+words.get(selectedHour), 20, dimension-80); 
  fill(color(188, 225, 255));
  text("KIROSANOJA: "+curses.get(selectedHour), 20, dimension -50); 
  if (category == 'k') {
    fill(color(178, 223, 147));
    text("KIROSANAT", widthX-180, dimension -140); 
    fill(color(188, 225, 255));
    text("YLEISET", widthX-180, dimension -50); 
    text("RASISMI", widthX-180, dimension -80);
    text("SEKSUAALISET", widthX-180, dimension -110);
  } else if (category == 's') {
    fill(color(178, 223, 147));
    text("SEKSUAALISET", widthX-180, dimension -110);
    fill(color(188, 225, 255));
    text("YLEISET", widthX-180, dimension -50); 
    text("RASISMI", widthX-180, dimension -80);
    text("KIROSANAT", widthX-180, dimension -140);
  } else if (category == 'r') {
    fill(color(178, 223, 147));
    text("RASISMI", widthX-180, dimension -80);
    fill(color(188, 225, 255));
    text("YLEISET", widthX-180, dimension -50); 
    text("KIROSANAT", widthX-180, dimension -140);
    text("SEKSUAALISET", widthX-180, dimension -110);
  } else if (category == 'y') {
    fill(color(178, 223, 147));
    text("YLEISET", widthX-180, dimension -50); 
    fill(color(188, 225, 255));
    text("KIROSANAT", widthX-180, dimension -140);
    text("RASISMI", widthX-180, dimension -80);
    text("SEKSUAALISET", widthX-180, dimension -110);
  }
  noFill();
}

void drawCircles() {
  stroke(color(200, 200, 200));
  strokeWeight(2);
  ellipse(0, 0, radiusOfOuter*2, radiusOfOuter*2); //outer circle
  fill(color(225, 225, 225));
  for (int i=0; i<24; i++) {
    ellipseMode(CENTER);
    ellipse(sin((TWO_PI/24)*i)*radiusOfOuter, cos((TWO_PI/24)*i)*radiusOfOuter, 5, 5);
  }
  fill(255);
  noStroke();
  ellipse(0, 0, radiusOfInner*2, radiusOfInner*2); //inner circle
  stroke(0);
  strokeWeight(2);
}

void drawBackground() {

  if (selectedHour == 0) {
    background(color(4, 27, 94));
  } else if (selectedHour > 0 && selectedHour <= 12) {
    background(color(4+selectedHour*15, 27+selectedHour*15, 94+selectedHour*15));
  } else {
    background(color(4+(24-selectedHour)*15, 27+(24-selectedHour)*15, 94+(24-selectedHour)*15));
  }

}

float sunPosY = 0;
float sunPosX = (wide - radiusOfOuter*2)/2/2;
float moonPosY = 0;
float moonPosX = (wide -(wide - radiusOfOuter*2)/2/2);
boolean down = true;
boolean on = true;

int scaleValue(int number) {
  return round(((float)number/(float)maxValue)*((float)radiusOfOuter-(float)radiusOfInner));
}


