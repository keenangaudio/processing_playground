import peasy.*;
import processing.sound.*;

int t = 0, scl = 64;
AudioIn playing;
Amplitude amp;
PeasyCam cam;
PVector[] p = new PVector[scl*scl*scl];
void setup()
{
  //size(420,360,P3D);
  fullScreen(P3D);
  cam = new PeasyCam(this,400);
  playing = new AudioIn(this, 1);
  playing.start();
  amp = new Amplitude(this);
  amp.input(playing);
  createCol(height/100);
}
void draw()
{
  background(5);
  strokeWeight(3+10*amp.analyze()); 
  //ortho();
  //translate(width/2, height/2, 0);
  //rotateX(radians((height/2-mouseY)/4));
  //rotateY(radians(-(width/2-mouseX)/4));
  for (PVector q : p)
    println(q);
    //point(q.x,q.y,q.z);
  println(frameRate);
  noLoop();
}
void createCol(float r)
{
  for (int i = 0; i<scl; i++)
    for (int j = 0; j<scl; j+=2)
      for (int k = 0; k<scl; k+=2)
      {
        int index = (i +j*scl + k*scl*scl);
        stroke(5*i+128, 5*j+128, 5*k+128);
        p[index] = new PVector(r*i, r*j, r*k);
      }
}