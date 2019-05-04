float F,a, m,t = 0,y,r = 20,timescale = 0.01,friction = 1,vi,v=0,x;
boolean done = false;
void setup()
{
  m = 1;
  a = -9.81;
  F = 2;
  y = height/2; x=width/9;
  vi = 0;
  size(500,500);
  frameRate(100);
}
void draw()
{
    background(0);
    //fill(120,267,250,100);rect(0,2*height/3,width,height/3);fill(255);
  if ((y+r > height || y-r<0)){
   vi = -fall(t);
   //t = 1;
   //m*=-1; 
  }
  x++;
  //a=fall(t);
  //v+=a*t;
  y += vi*t +fall(t);
  t+=timescale;
  friction = m*0.01;
  ellipse(x,y,r,r);
  text(t,30,30);
}
float fall(float x)
{ 
  return  -(0.5*a)*x*x;
}