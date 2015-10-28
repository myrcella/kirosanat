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
  background(255);
  pushMatrix();
  translate(dimension/2, dimension/2+35);
  rotate(PI + (selectedHour * (PI / 12))); // rotates according to the selected Hour
  drawTotalWords();
  drawTotalCurses();
  drawCircles();
  popMatrix();
  drawDetails();
  drawWordCloud();
} 


void keyReleased() {
  if (key == 'r') {
    if (selectedHour<24) {
      selectedHour += 1;
    } else {
      selectedHour = 0;
    }    
    redraw();
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == SHIFT) {
      if (currentX < mouseX) {
        if (selectedHour < 22) {
          selectedHour+=1;
        } else {
          selectedHour = 0;
        }
        currentX = mouseX;
      } else {
        if (selectedHour > 0) {
          selectedHour += -1;
        } else {
          selectedHour = 23;
        }
        currentX = mouseX;
      }
      redraw();
    }
  }
}


