import processing.sound.*;
import javax.sound.sampled.*;
AudioIn playing,p2;
FFT ana;Amplitude amp; int bands = 256,t=-90; float x,y;
LowPass LP; int c = 0;
float[] spec = new float[bands];
void setup()
{
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
  
 y =0; x=0;
} 

void draw()
{
  //ortho();
  colorMode(HSB);
  //if (frameCount%2==0)
  float h2 = map(mouseY,0,height,0,12);
  float h3 = map(mouseX,0,width,0,height/2);
  if (c<360){background(map(c++,360,0,0,255),100,200);} else {c=1;background(map(c,360,0,0,255),100,200);} 
  //rect(0,0,-10,width,height);
  translate(width/2,height/2,-300);
  //rotateY(radians(t));
  //rotateX(radians(t));
  if (frameCount%5==0) t++;
  //fill(0);text(frameRate,30,30);
  ana.analyze(spec);
  float d = map(amp.analyze(),0,1,23,28);
  
  int k = 0 , a = 255 , h;
  //int(round(map(i,0,360,0,bands)))
  float s = (bands-k)/180 + 0.1;
    for (int n = 0; n < bands-k; n++)
    { 
    //if (n%1==0)
      {
        float i = abs((map(n,0,bands-k,0,360)));float j = abs((map(i,180,0,180,360)));//i=(i<180)?i-90:i; i=(i<270)?i-180:i; i=(i<360)?i-270:i;
        stroke(map(i,0,360,0,255),100,120,a);fill(map(i,0,360,0,255),100,120,a);
        spec[n]*= 1 *map(spec[n],0.00,1,50,h3);
        h = int(map(n,0,bands-k,0,128));
        
        if (i<180)
          triangle(x,y,x+(d+spec[h])*h2*cos(radians((i)-t)),y+(d+spec[h])*h2*sin(radians((i)-t)),
                       x+(d+spec[h])*h2*cos(radians((i+s)-t)),y+(d+spec[h])*h2*sin(radians((i+s)-t)));
        if (j>=180)  
          triangle(x,y,x+(d+spec[h])*h2*cos(radians((j)-t)),y+(d+spec[h])*h2*sin(radians((j)-t)),
                       x+(d+spec[h])*h2*cos(radians((j+s)-t)),y+(d+spec[h])*h2*sin(radians((j+s)-t)));
       }
    }
}

void keyPressed()
{ 
  playing.stop();
  p2.stop();
  exit();
}