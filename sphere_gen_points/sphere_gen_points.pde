//DEFAULTS
  int render_quality = 35;  //must be less than rQMax
  int dev = 23;       //10 times value used
  float r = 120;      //
  float sea = 0.9;    //
  float zoom = 460;   //
  float sWeight = 0;  //bigger than 10 looks hella bad

//Safegaurds
int rQMax = 61 ;
int ren_qual = (render_quality < rQMax)? render_quality : rQMax;
//Modes
boolean resu = false, colmode = true, projMode = true, real = true; //render quality
float rX = 0, rY = 0,mX = width/2,mY=height/2,t,a;
PVector[][] sPoint = new PVector[(rQMax)][(rQMax)], col = new PVector[(rQMax)][(rQMax)];
PShape mouse;

void setup()
{
  t=1;
  PVector col1 = new PVector(124,217,224);
  PVector col2 = new PVector(107,211,123);
  mouse = createShape();
  create(mouse);
  mouseLoc(mouse);
  //noCursor();
  //size (720,640,P3D);
  fullScreen(P3D);
  strokeWeight(sWeight);
  colorMode(HSB);
  if (!(keyCode == 'G')) //holding G will preserve points
  {
  for (int i = 0;i<ren_qual ;i++)
  {
    for (int j = 0;j<ren_qual ;j++)
    {
        sPoint[i][j] = spherePoint(i,j);//108:107,161:211,206:123
        boolean g = random(1)<0.6;
        col[i][j] = (g? col1 : col2);
    }
  }
  }
}
void draw() 
{
  
  if (mousePressed == true)
  {
    mX = mouseX;
    mY = mouseY;
  }
  a = (a<360)? a+0.1:0;
  //t = 1+0.1*(sin(radians(a)));
 if (projMode) perspective(); else ortho();
 lights();
 //mouseLoc(mouse);
 background(#A9E8F2);
 view();
 origin(0,0,0);
 fill(#1780AF);noStroke();
 if (real) sphere(r+sea);
 //fill(#6BD37B);stroke(100);
 
 if (colmode) stroke(#52A55F,100); else stroke(120,100);
 
  for (int i = 0;i<ren_qual ;i++){
    for (int j = 0;j<ren_qual ;j++){
      if (colmode && !real) fill(col[i][j].x,col[i][j].y,col[i][j].z);else if (!real) fill(200); else fill(#6BD37B);
      //stroke(map(j,0,ren_qual,0,255),100,120);//col[i][j]
      //sPoint[i][j].mult(t);
      drawSurface(i,j,resu);
     // sPoint[i][j].mult(1/t);
    }
  }
}

void view()
{ 
 translate(width/2,height/2,zoom);
 { rX -= ((width/2)-abs(mX))/85.0; rY -= ((height/2)-abs(mY))/95.0;}
 rotateY(radians(rX));
 rotateX(radians(rY));
}

void mouseLoc(PShape x)
{
  
  int dx = mouseX - width/2;
  int dy = mouseY - height/2;
  float angle = atan2(dy,dx);
  x.rotate(angle);
  x.translate(mouseX,mouseY);
  
  shape(x);
}