

//Seaches the row of 11 brightest pixels in the video. BrightestX and brightestY mark the center of this brightest row.
void reddest() {
  pointerX = 0; // X-coordinate of the brightest video pixel
  pointerY = 0; // Y-coordinate of the brightest video pixel
  float reddestPoint = 0; // Brightness of the brightest video pixel
  // Search for the brightest pixel: For each row of pixels in the video image and
  // for each pixel in the yth row, compute each pixel's index in the video
  int index = 0;
  for (int y = 0; y < cam.height; y++) {
    for (int x = 0; x < cam.width; x++) {
      // Get the color stored in the pixel
      int pixelValue = cam.pixels[index];
      // Determine the brightness of the pixel
      float pixelRedness = red(pixelValue) - blue(pixelValue) - green(pixelValue);
      // If that value is redder than any previous, then store the
      // redness of that pixel, as well as its (x,y) location
      if (pixelRedness > reddestPoint) {
        reddestPoint = pixelRedness;
        pointerY = y;
        pointerX = width - x - 1; // Mirror the x-coordinate to achieve screen-mirror effect
      }
      index++;
    }
  }
}

