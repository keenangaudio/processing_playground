int t = 0;
void setup()
{
  size(500,500);
  frameRate(10);
  colorMode(HSB);
}
void draw()
{
  if (t<255)  background(t++,100,200); 
  else {t=1;  background(t,100,200);}
  textSize(48);textAlign(CENTER);
  text(t,width/2,height/2);
}