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
  initIntListTotal();
  initIntListCurses();
}

void draw() {
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


void keyReleased() {
  if (key == 'r') {
    if (selectedHour<23) {
      selectedHour += 1;
    } else {
      selectedHour = 0;
    }    
    redraw();
  }
  if (key == CODED) {
    if (keyCode == SHIFT) {
      moving = 0;
      startingPoint=0;
    }
  }
}

int startingPoint = 0;
int moving = 0;

void keyPressed() {
  if (key == CODED) {
    if (keyCode == SHIFT) {
      moving = (int)round((float)(mouseX-startingPoint)/(float)400);          
      if (moving == 0) {
        startingPoint=mouseX;
      } else {
        if ((selectedHour < 22 && moving > 0) || (selectedHour > 0 && moving < 0)) {
          selectedHour+= moving;
        } else if (moving >  0) {
          selectedHour = 0;
        } else {
          selectedHour = 23;
        } 
        redraw();
      }
    }
  }
}

