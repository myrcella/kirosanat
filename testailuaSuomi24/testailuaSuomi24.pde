import wordcram.*;
import processing.video.*;
import ddf.minim.*;

Capture cam;
//The brightest pixels in the original video, not mirrowed!
float pointerX = 0;
float pointerY = 0;

int heightY = 720;
int widthX = 1280;
int radiusOfInner = 180;
int radiusOfOuter = heightY/2-70;
int selectedHour = 0;
int maxValue = 0;
char category = 'k';
IntList currentList;

float startingPoint = 0;
boolean moving = false;

AudioPlayer player;

void setup() {
  size(widthX, heightY);
  background(255);
  cam = new Capture(this, width, height);
  cam.start();
  stroke(0);
  strokeWeight(2);
  noFill();
  noLoop();
  detectAudio();
  currentList = curses;
  minim = new Minim(this);
  player = minim.loadFile("crowd_milling_about.mp3");
  player.play();
  player.loop();
  initData();
}

void draw() {
  if (cam.available()) {
    // draws the video picture
    cam.read();
    cam.loadPixels();
    image(cam.get(), -width, 0);
    reddest(); // finds the brightest pixel
  }
  drawBackground();
  scroll();
  detectHighest();
  reddest();
  pushMatrix();
  translate(widthX/2, heightY/2+35);
  rotate(TWO_PI - (selectedHour * (TWO_PI / 24))); // rotates according to the selected Hour
  drawTotalCurses();
  drawCircles();
  popMatrix();
  drawDetails();
  drawWordCloud();
} 

void keyPressed() {
  if (key == 'r') {
    startingPoint = pointerX;
    moving = true;
    loop();
  }
  if (key == 'v') {
    player.pause();
    detectHighest();
    loop();
  }
}

void keyReleased() {
  if (key == 'r') {
    moving = false;
  }
  if ( key == 'v' ) { 
    player.play();
    if (highest > 50) {
      if (category == 's') {
        category = 'k';
      } else if (category == 'r') {
        category = 's';
      } else if (category == 'y') {
        category = 'r';
      }
    } else {
      if (category == 'k') {
        category = 's';
      } else if (category == 's') {
        category = 'r';
      } else if (category == 'r') {
        category = 'y';
      }
    }
  }
  noLoop();
  draw();
}

void scroll() {
  if (moving) {
    if (pointerX-startingPoint > 50) { // if red object is dragged to right
      startingPoint = pointerX;
      if (selectedHour<23) {
        selectedHour += 1;
      } else {
        selectedHour = 0;
      }
    } else if (pointerX-startingPoint < -50) { // if red object is dragged to left
      startingPoint = pointerX;
      if (selectedHour>0) {
        selectedHour -= 1;
      } else {
        selectedHour = 23;
      }
    }
  }
}

