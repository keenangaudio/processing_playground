int res = 60;
float dev = 5 , r = 360;
float rX=0 , rY=0 , zoom = 0;
PVector[][] point  = new PVector[res][res];
PVector[][] point2 = new PVector[res][res];
void setup()
{
  strokeWeight(3);stroke(0,55);
  size(displayWidth,displayHeight,P3D);
  for(int i = 0 ; i < res ; i++)
  {
    for(int j = 0 ; j < res ; j++)
    {
      point[i][j] = sPoint(i,j,r);
      point2[i][j] = sPoint(i,j,r*4/5);
    }
  }
}

void draw() 
{
  view();
  lights();
  for(int i = 0 ; i < res ; i++)
  {
    fill(map(abs(i-res/2),0,res,50,200));
    beginShape(TRIANGLES);
    for(int j = 0 ; j < res ; j++)
    {
      fill(map(abs(j-res/2),0,res,50,200));
      vertex(point[i][j].x,point[i][j].y,point[i][j].z);
      vertex(point2[i][j].x,point2[i][j].y,point2[i][j].z);
    }
    endShape();
  }
}

PVector sPoint(int i,int j,float r_)
{
  float x,y,z;
  float irad = radians(map(i,0,res-1,0,360)),
        jrad = radians(map(j,0,res-1,0,180));//40,140
        
  x = randomGaussian()*dev +r_*cos(irad)*sin(jrad);
  y = randomGaussian()*dev +r_*sin(irad)*sin(jrad);
  z = randomGaussian()*dev +r_*cos(jrad);
  
  return new PVector(x,y,z);
}

void view()
{ 
  background(200);
  translate(width/2,height/2,zoom);
   rX -= ((width/2)-abs(mouseX))/85.0; rY -= ((height/2)-abs(mouseY))/95.0;
  rotateY(radians(rX));
  rotateX(radians(rY));
}