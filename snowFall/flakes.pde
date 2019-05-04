class snow
{
  PVector location , speed ;
  PShape snowflake;
  float r = random(3,12);
  int a; float bool = random(-1,1); 
  void create(int x) //position
  {
  location = new PVector(random(1+x*(width/n),2+x*(width/n)),-12);
  speed    = new PVector(random(-0.5,0.5),0.45);
  
  snowflake = createShape();
  createFlake(snowflake,r);
  }
  void update()
  {
    
    speed.x += randomGaussian()*0.02; //gives it a little wiggle side to side
    location.add(speed);
    snowflake.rotateZ(radians(bool));
    snowflake.rotateX(radians(bool));
    if (!Blood) shape(snowflake,location.x,location.y); else  ellipse(location.x,location.y,r,r);
  }
  PVector location()
  {
    return location;
  }
  
  void createFlake(PShape s,float r_)  /// shape, radius
  {
    int arms = int(random(5,9)) , hands = int(random(2,4));
    float[] handRad = new float[hands], handDev = new float[hands], handPos = new float[hands];
    for(int i = 0; i< hands;i++)
    {
      float x1 = (hands-i)/hands, x2 = (hands-(i+1))/hands;
      handRad[i] = random(x2,x1)*r_;
      handDev[i] = random(1,6);
      handPos[i] = random(0.95,1.05)*x1*r_;
    }
    s.beginShape();
    for (int i = 0; i< arms; i++)//main arms
    {
      s.vertex(r_*sin(radians(i*360/arms)),r_*cos(radians(i*360/arms)));
      for (int j = 0; j<hands;j++)//the sticky outy bits
      {
        s.vertex(handPos[j]*sin(radians(i*360/arms)),handPos[j]*cos(radians(i*360/arms)));
        s.vertex(handRad[j]*sin(radians((i+handDev[j])*360/arms)),handRad[j]*cos(radians((i+handDev[j])*360/arms)));
        s.vertex(handRad[j]*sin(radians((i-handDev[j])*360/arms)),handRad[j]*cos(radians((i-handDev[j])*360/arms)));
        s.vertex(handPos[j]*sin(radians(i*360/arms)),handPos[j]*cos(radians(i*360/arms)));
      }
      s.vertex(0,0);
    }
    s.endShape();
    
  }
}