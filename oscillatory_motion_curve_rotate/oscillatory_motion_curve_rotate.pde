Curve[] c = new Curve[15];
void setup()
{
  for (int i = 0;i<c.length;i++)
    c[i] = new Curve(i);
  frameRate(240);
  fullScreen();
  noCursor();
  //size(800,600);
}
void draw()
{
  //frameRate(60);
  
    fill(0, 25);  
    noStroke();
    rect(0, 0, width, height);
    background(0);
  pushMatrix();
  //translate(0,height/2);
  //rotate(atan2(mouseY-width/2,mouseX));
  for (int i = 0;i<c.length;i++)
  {
    //translate(i*30,0);
    c[i].frame();
  }
  
  popMatrix();
   text(frameRate,20,20);
}