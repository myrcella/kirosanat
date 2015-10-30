import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioInput in;
FFT fft;
int highest=0;

void detectAudio() {
  minim = new Minim(this);
  in = minim.getLineIn(Minim.MONO, 4096, 44100); 
  fft = new FFT(in.left.size(), 44100);
}

void detectHighest() {
  highest = 0;
  fft.forward(in.left);
  for (int n = 0; n < fft.specSize (); n++) {
    if (fft.getBand(n)>fft.getBand(highest))
      highest=n;
  }
}

void stop()
{
  in.close();
  minim.stop();
  super.stop();
}

