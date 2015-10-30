import wordcram.*;
import processing.video.*;

Capture cam;
//The brightest pixels in the original video, not mirrowed!
float brightestX = 0;
float brightestY = 0;

int dimension = 960;
int widthX = 1280;
int radiusOfInner = 200;
int radiusOfOuter = dimension/2-70;
int selectedHour = 0;
int maxValue = 190;
int currentX = 0;
char category = 'k';

boolean changeHour = false;

void setup() {
  size(widthX, dimension);
  background(255);
  cam = new Capture(this, width, height);
  cam.start();
  stroke(0);
  strokeWeight(2);
  noFill();
  noLoop();
  detectAudio();
}

void draw() {
  if (cam.available()) {
    // draws the video picture
    cam.read();
    cam.loadPixels();
    scale(-1, 1); // mirrors the video picture
    image(cam.get(), -width, 0);
    brightest(); // finds the brightest pixel

  }

  scroll();
  detectHighest();
  drawBackground();
  pushMatrix();
  translate(widthX/2, dimension/2+35);
  rotate(PI - (selectedHour * (PI / 12))); // rotates according to the selected Hour
  drawTotalWords();
  drawTotalCurses();
  drawCircles();
  popMatrix();
  drawDetails();
  drawWordCloud();
  brightest();

} 

float startingPoint = 0;
boolean moving = false;
float direction = 0;



void keyPressed() {
  if (key == 'r') {
    startingPoint = brightestX;
    moving = true;
    loop();
  }
}

void keyReleased() {
  if (key == 'r') {
    moving = false;
    noLoop();
    draw();
  }
}

void scroll() {
  if (moving) {
    direction = brightestX-startingPoint;
    if (direction > 0) { // if mouse is dragged to left
      startingPoint = brightestX;
      if (selectedHour<23) {
        selectedHour += 1;
      } else {
        selectedHour = 0;
      }
    } else if (direction < 0) { // if mouse is dragged to right
      startingPoint = brightestX;
      if (selectedHour>0) {
        selectedHour -= 1;
      } else {
        selectedHour = 23;
      }
    }
  }
}

