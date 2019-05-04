int  res = 1000;
float  r = 30,
variance = 1,
    tscl = 0.0001;
float[][] mult = new float[res][3];
void setup()
{
  //fullScreen();
  size(800,600);
  background(0);
  colorMode(HSB);
  
  stroke(random(255),200,200);
  noFill();
  strokeWeight(2);
  for(int i = 0; i < res ; i++){
      mult[i][0] = 1;
      mult[i][1] = 0;
      mult[i][2] = 0;
  }
}
void draw()
{
  tscl = 0.01000008;
  background(0);
  showNoise();
  translate(width/2,height/2);

  beginShape();
  
  for(int index = 1; index <= res; index++)
  {
    float m = move(index);
    float i = index * TWO_PI/res;
    vertex(m*cos(i), m*sin(i) );
  }
  
  endShape(CLOSE);
}

float move(int index)
{
  int i = index - 1;
  
  //mult[i][2]  = 0.00001*(0.5 - noise(10+frameCount*tscl*i) );  // +- value
  //mult[i][1] -= mult[i][2];
  //mult[i][0] += mult[i][1];
  
  return 150+(0.25-noise((frameCount+i)*tscl))*50*mult[i][0];
}
void showNoise()
{
  for(int i = 0; i < width; i++)
    point(i, 5+10*noise(i*tscl));
}