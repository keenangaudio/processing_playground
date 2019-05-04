import peasy.*;

PeasyCam c;
spring[][] grid;
int scl = 10;
int rows;
int cols;
float median = 128;
float click;
int tempI, tempJ;
class spring
{
  double pos;
  double nextpos;
  double speed;
  double F;
  double k = 0.82; //spring constant

  spring(float a)
  {
    pos = a;
    nextpos = pos;
    speed = 0;
  }
  void update(int i, int j)
  {
    springy();
    pos+=speed;
    //if (frameCount %5==0) 
    mesh(i, j);

    float r = scl/2;

    //fill((float)pos*255/(2*median));
    //ellipse(i*scl, j*scl, 2*r, 2*r);
    //point(i*scl, j*scl, (float)pos/25);
  }
  void show(int i, int j)
  {
   // curveVertex(i*scl, j*scl, (float)pos/25);
    point(i*scl, j*scl, (float)pos/25);
}
  void mesh(int ind, int jnd)
  {
    double avg = 0;
    int count = 0;
    for (int i = ind-1; i<ind+2; i++)
    {
      if (i<0||i>=cols) 
      {
        avg+=3*median;
        count+=3;
        continue;
      }
      for (int j = jnd-1; j<jnd+2; j++)
      {
        if ((j<0||j>=rows)) 
        {
          avg+=median;
          count++;
          continue;
        }
        double oVal = grid[i][j].pos;// - median;
        count++;
        avg +=  oVal;//(i == ind || j == jnd)?  ((i==ind && j==jnd)? oVal :  oVal*0.95) : oVal*0.65;
      }
    }
    //nextpos=pos*0.25+0.75*avg/9;
    nextpos = avg/count;
    //pos = pos>1?1:pos;
    //pos = pos<0?0:pos;
  }
  void springy()
  {
    F = k*(median-pos); //spring formula
    speed+=F;
    speed*=0.87;
  }
  void refresh()
  {
    pos = nextpos;
  }
}

void setup()
{
  size(600, 600, P3D);
  frameRate(240);
  ellipseMode(CENTER);
  c = new PeasyCam(this, 100);
  rows = height/scl;
  cols = width/scl;
  grid = new spring[rows][cols];
  for (int i = 0; i< grid.length; i++)
    for (int j = 0; j< grid[i].length; j++)
      grid[i][j] = new spring(median);
}

void draw()
{
  background(0);
  stroke(255);
  //strokeWeight(4);
  for (int i = 0; i< grid.length; i++)
    for (int j = 0; j< grid[i].length; j++)
      grid[i][j].refresh();
  PVector ind = new PVector(mouseX/scl, mouseY/scl);
  if (keyPressed && ind.x>0 && ind.x<rows && ind.y>0 && ind.y<cols && key==32) 
    grid[int(ind.x)][int(ind.y)].pos = median*(frameCount - click);
  noFill();
  
  beginShape();
  for (int i = 0; i<cols; i++)
    for (int j = 0; j<rows; j++)
    {
      grid[i][j].update(i, j);
      grid[i][j].show(i, j);
    }
  endShape();
}

void keyPressed()
{
  click = frameCount;
}
//void mouseReleased()
//{
//  int index = round(mouseX/scl) + round(mouseY/scl)*cols;
//  grid[index].pos = median*8*(frameCount - click);
//}
