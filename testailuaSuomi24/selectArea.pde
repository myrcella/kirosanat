

//Seaches the row of 11 brightest pixels in the video. BrightestX and brightestY mark the center of this brightest row.
void brightest() {
  float brightestValue = 0;
  int index = 0;
  for (int y = 0; y < cam.height; y++) {
    for (int x = 0; x < cam.width; x++) {
      float brightnesses = 0;
      for (int p = index-5; p < index + 6; p++) {
        int pixelValue = cam.pixels[index];
        brightnesses += brightness(pixelValue);        
      }
      float averageBrightness = brightnesses/11;
      if (averageBrightness > brightestValue) {
        brightestValue = averageBrightness;
        brightestY = y;
        brightestX = x;
      }
      index++;
    }
  }
}

