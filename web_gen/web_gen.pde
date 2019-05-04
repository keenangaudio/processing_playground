int zoom = 10, rQMax = 46, ren_qual = rQMax;
float r = 120, rX=0, rY=0,mX = 0,mY = 0;
PVector[][] sPoint = new PVector[(ren_qual)][(ren_qual)];
float[][] col = new float[(ren_qual)][(ren_qual)];
float[][] gauss = new float[(ren_qual)][(ren_qual)];
int[][] connect = new int[(ren_qual)][(ren_qual)];
void setup()
{
  size(800,720,P3D);
  for (int i = 0;i<ren_qual ;i++)
  {
    for (int j = 0;j<ren_qual ;j++)
    {
        sPoint[i][j] = spherePoint(i,j);
        col[i][j] = randomGaussian()*30+127;
        gauss[i][j] = randomGaussian()*20+30;
        connect[i][j] = intRan(i);
    }
  }
  stroke(255);
  strokeWeight(3);
  colorMode(HSB);
}
void draw() 
{
  if (mousePressed == true){mX = mouseX;mY = mouseY;}
 background(0);
 //pointLight();
 view();
 beginShape(TRIANGLE_STRIP);
 for (int i = 0;i<ren_qual ;i++){
    for (int j = 0;j<ren_qual ;j++){
      stroke(col[i][j],gauss[i][j]+70,200,gauss[i][j]);//
      drawSurface(i,j,2);
    }
  }
  endShape();
}
void keyPressed()
{
  if (keyCode == RIGHT)
  ren_qual+=(ren_qual<rQMax)?1:0;
  else if (keyCode == LEFT)
    ren_qual--;
  else if (keyCode == UP)
    zoom+=20;
  else if (keyCode == DOWN)
    zoom-=20;
  setup();
}
PVector spherePoint(float i,float j)
{
  float dev = 180;
  float x, y, z;
  //float irad = radians(map(i,0,ren_qual,0,360)),
       // jrad = radians(map(j,0,ren_qual,0,360));
  x = randomGaussian()*dev ;//*r*cos(irad)*sin(jrad); //1-dev,1+dev
  y = randomGaussian()*dev ;//*r*sin(irad)*sin(jrad);
  z = randomGaussian()*dev ;//*r*cos(jrad);
  return new PVector(x,y,z);
}
void drawSurface(int i, int j,int res)
{
  noFill();
  //beginShape(TRIANGLE_FAN);
    vertex(sPoint[i][j].x,sPoint[i][j].y,sPoint[i][j].z);
    if (res == 1)
      vertex(0,0,0);
    else{  
    //if (i-1>=0 && res>1)
      //vertex(sPoint[intRan(i)][intRan(j)].x,sPoint[intRan(i)][intRan(j)].y,sPoint[intRan(i)][intRan(j)].z);
    /*if (j-1>=0 && res>1)
      vertex(sPoint[i][j-1].x,sPoint[i][j-1].y,sPoint[i][j-1].z);
    if (i+1<=0 && res>2)
      vertex(sPoint[i-2][j].x,sPoint[i-2][j].y,sPoint[i-2][j].z);
    if (j+1<=0 && res>2)
      vertex(sPoint[i][j+1].x,sPoint[i][j+1].y,sPoint[i][j+1].z);*/
      vertex(sPoint[connect[i][j]][connect[j][i]].x,sPoint[connect[i][j]][connect[j][i]].y,sPoint[connect[i][j]][connect[j][i]].z);
      vertex(sPoint[connect[i][j]][connect[j][i]].x,sPoint[connect[i][j]][connect[j][i]].y,sPoint[connect[i][j]][connect[j][i]].z);
  }
  //endShape();
}
int intRan(int a)
{
  return (int)random(a);
}
void view()
{
 
 translate(width/2,height/2,zoom);
 { rX -= ((width/2)-abs(mX))/80.0; rY -= ((height/2)-abs(mY))/80.0;}
 rotateY(radians(rX));
 rotateX(radians(rY));
}