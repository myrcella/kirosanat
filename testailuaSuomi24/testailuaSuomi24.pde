import wordcram.*;


int dimension = 800;
int radiusOfInner = 200;
int radiusOfOuter = dimension/2-40;
int selectedHour = 0;
int maxValue = 190;
int currentX = 0;


boolean changeHour = false;

void setup() {
  size(dimension, dimension);
  background(255);
  stroke(0);
  strokeWeight(2);
  noFill();
  noLoop();
  //initData();
  detectAudio();
}

void draw() {
  scroll();
  detectHighest();
  drawBackground();
  pushMatrix();
  translate(dimension/2, dimension/2+35);
  rotate(PI - (selectedHour * (PI / 12))); // rotates according to the selected Hour
  drawTotalWords();
  drawTotalCurses();
  drawCircles();
  popMatrix();
  drawDetails();
  drawWordCloud();
} 

int startingPoint = 0;
boolean moving = false;
float direction = 0;



void keyPressed() {
  loop();
  if (keyCode == CONTROL) {
    startingPoint = highest;
    moving = true;
  }
}

void keyReleased() {
  noLoop();
  if (keyCode == CONTROL) {
    moving = false;
  }
  if ( key == 'v' ) { 
    println(highest);
    if (highest>50) {
      println("up");
    } else {
      println("down");
    }
  }
}

void scroll() {
  if (moving) {
    direction = highest-startingPoint;
    if (direction > 0) { // if mouse is dragged to left
      startingPoint = highest;
      if (selectedHour<23) {
        selectedHour += 1;
      } else {
        selectedHour = 0;
      }
    } else if (direction < 0) { // if mouse is dragged to right
      startingPoint = highest;
      if (selectedHour>0) {
        selectedHour -= 1;
      } else {
        selectedHour = 23;
      }
    }
  }
}

