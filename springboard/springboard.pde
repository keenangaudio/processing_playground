import peasy.*;

int  hres = 90, vres = 144;
Spring[][] spr;
PeasyCam c;

void setup()
{
  //size(600,600,P3D);
  fullScreen(P3D);
  frameRate(120);
  c = new PeasyCam(this, 100);
  
  
  float w = width;
  float h = height;
  spr = new Spring[vres+1][hres+1];
  for (int i = 0; i <= vres; i++)
    for (int j = 0; j <= hres; j++)
      spr[i][j] = new Spring(i,j);
  colorMode(HSB);
  strokeWeight(3);
  noFill();
}

void draw()
{
  background(100);
  
  for (int i = 0; i <= vres; i++)
    for (int j = 0; j <= hres; j++)
      spr[i][j].collectForces();
      
  for (int i = 0; i <= vres; i++)
    for (int j = 0; j <= hres; j++)
      spr[i][j].show();
      

    for (int i = 0; i <= vres - 1; i++)
    {
      beginShape();
      for (int j = 0; j <= hres; j++)
        for (int k = 0; k < 2; k++)
        {
          stroke(2*((float)spr[i][j].val-130));
          vertex((i+k)*width/vres - width/2, j*height/hres - height/2,5*((float)spr[i+k][j].val-130));
        }
      endShape();
    }
    //for (int i = 0; i <= vres-1; i++)
    //  for (int j = 0; j <= hres; j++)
    //  {
    //    stroke(2*((float)spr[i][j].val-130),200,200);
    //    point((i)*width/vres - width/2, j*height/hres - height/2,0);
    //  }
}
void mousePressed()
{
  int i, j;
  i = round(map(mouseX,0,width,0,vres));
  j = round(map(mouseY,0,height,0,hres));
  spr[i][j].val = 255;
}

class Spring
{
  double val, v, f;
  double k = 0.01,
      dval = 130;
  int i, j;
  
  Spring(int i_, int j_)
  {
     i = i_;
     j = j_;
     val = dval;
  }
  void show()
  {
    v += f;    // f = a , m = 1
    v *= 0.9995; // friction
    val += v;
    f = 0;
    
    //stroke((float)val);
    //strokeWeight( map((float)val,0,255,0,50) );
    //point(i*width/vres, j*height/hres,0);
    //text(val + "\n" + f,i*width/vres, j*height/hres);
  }
  void collectForces()
  {
    f = -( (val - dval) * k);
    
    f += hLaw( 1,0);
    f += hLaw(0, 1);
    f += hLaw(-1,0);
    f += hLaw(0,-1);
    
  }
  double hLaw(int iOff,int jOff)
  {
    double p = 0.25; //proportionality constant (keep below 0.25)
    double otherVal;
    
    if (i+iOff >= vres || i-iOff <= 1 || j+jOff >= hres || j-jOff <= 1)
      otherVal = 0;  //padding
    else
      otherVal = spr[i + iOff][j + jOff].val - dval;
    
    return otherVal * k * p;
  }
}