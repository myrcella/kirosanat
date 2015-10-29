import wordcram.*;
import processing.video.*;

Capture cam;
//The brightest pixels in the original video, not mirrowed!
float brightestX = 0;
float brightestY = 0;


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
  //cam = new Capture(this, width, height);
  //cam.start();
  stroke(0);
  strokeWeight(2);
  noFill();
  noLoop();
}

void draw() {
  scroll();
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
  if (key == 'r') {
    startingPoint = mouseX;
    moving = true;
    loop();
  }
}

void keyReleased() {
  if (key == 'r') {
    moving = false;
    noLoop();
  }
}


void scroll() {
  //while (moving == true) {
    println("jei");
    if (moving) {
      direction = mouseX-startingPoint;
      if (direction > 0) { // if mouse is dragged to left
        startingPoint = mouseX;
        if (selectedHour<23) {
          selectedHour += 1;
        } else {
          selectedHour = 0;
        }
        drawDetails();
      } else if (direction < 0) { // if mouse is dragged to right
        startingPoint = mouseX;
        if (selectedHour>0) {
          selectedHour -= 1;
        } else {
          selectedHour = 23;
        }
        drawDetails();
      }
    }
  //}
  println("loppu");
}

