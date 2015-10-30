

//Seaches the row of 11 brightest pixels in the video. BrightestX and brightestY mark the center of this brightest row.
void brightest() {
  brightestX = 0; // X-coordinate of the brightest video pixel
  brightestY = 0; // Y-coordinate of the brightest video pixel
  float brightestValue = 0; // Brightness of the brightest video pixel
  // Search for the brightest pixel: For each row of pixels in the video image and
  // for each pixel in the yth row, compute each pixel's index in the video
  int index = 0;
  for (int y = 0; y < cam.height; y++) {
    for (int x = 0; x < cam.width; x++) {
      // Get the color stored in the pixel
      int pixelValue = cam.pixels[index];
      // Determine the brightness of the pixel
      float pixelBrightness = brightness(pixelValue);
      // If that value is brighter than any previous, then store the
      // brightness of that pixel, as well as its (x,y) location
      if (pixelBrightness > brightestValue) {
        brightestValue = pixelBrightness;
        brightestY = y;
        brightestX = x;
      }
      index++;
    }
  }
}

