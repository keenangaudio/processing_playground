import processing.sound.*;
import javax.sound.sampled.*;
AudioIn playing,p2;
FFT ana;Amplitude amp; int bands = 256, t=-90; float x,y;
LowPass LP; int c = 0;
Node[] spec = new Node[bands];

void setup() {
  for (Node s : spec) {
    s = new Node();
  }
  fullScreen(P3D);//size(712,500);
  frameRate(120);
  playing = new AudioIn(this, 1);
  p2 = new AudioIn(this, 1);
  ana = new FFT(this,bands);
  amp = new Amplitude(this);
  y = height-50;
  playing.start();
  p2.start();
  ana.input(playing);
  amp.input(p2);
  strokeWeight(5);
  y =0; x=0;
}
void draw() {
  
}
