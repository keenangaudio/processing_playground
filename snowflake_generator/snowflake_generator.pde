PVector loc;
PShape snowflake;
void setup()
{
  stroke(#DCEEFA);
  size(500,500,P3D);
  snowflake = createShape();
  loc = new PVector(width/2,height/2);
  createFlake(snowflake,random(85,230));
}

void draw()
{
  background(200);
  strokeWeight(1);//random(3));
  snowflake.rotateZ(radians(mouseX-pmouseX));
  snowflake.rotateX(radians(mouseY-pmouseY));
  shape(snowflake,loc.x,loc.y);
  
}

void createFlake(PShape s,float r)
{
  int arms = int(random(3,11)) , hands = int(random(6,12));
  float[] handRad = new float[hands], handDev = new float[hands], handPos = new float[hands];
  for(int i = 0; i< hands;i++)
  {
    float x1 = (hands-i)/hands, x2 = (hands-(i+1))/hands;
    handRad[i] = random(x2,x1)*r;
    handDev[i] = random(1,6);
    handPos[i] = random(0.95,1.05)*x1*r;
  }
  s.beginShape();
  for (int i = 0; i< arms; i++)//main arms
  {
    s.vertex(r*sin(radians(i*360/arms)),r*cos(radians(i*360/arms)));
    for (int j = 0; j<hands ;j++)//the sticky outy bits
    {
      s.vertex(handPos[j]*sin(radians(i*360/arms)),handPos[j]*cos(radians(i*360/arms)));
      s.vertex(handRad[j]*sin(radians((i+handDev[j])*360/arms)),handRad[j]*cos(radians((i+handDev[j])*360/arms)));
      s.vertex(handRad[j]*sin(radians((i-handDev[j])*360/arms)),handRad[j]*cos(radians((i-handDev[j])*360/arms)));
      s.vertex(handPos[j]*sin(radians(i*360/arms)),handPos[j]*cos(radians(i*360/arms)));
    }
   // s.vertex(0,0);
  }
  s.endShape();
  
}
void keyPressed()
{
 setup(); 
}