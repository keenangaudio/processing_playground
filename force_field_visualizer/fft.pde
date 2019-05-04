import javax.sound.sampled.*;
AudioIn playing;
FFT ana;
int bands = 256; 
float[] spec = new float[bands];
//float[] max  = new float[bands];

void initFFT() {
  playing = new AudioIn(this,1);
  ana = new FFT(this, bands);
  playing.start();
  ana.input(playing);
  for(int i = 0; i < bands; i++) spec[i] = 0;
}

float[] sample() {
 ana.analyze(spec); 
  return spec;
}
