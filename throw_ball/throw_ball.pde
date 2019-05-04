float y,x,dx,v=0,r=10;
boolean mc = false;
void setup()
{
  size(800,800);
  y=height/2;
  x=width/2;
  frameRate(240);
  dx = 0.8;
  v=-1;
}
void draw()
{
  fill(0,10);  noStroke();
  rect(0,0,width,height);
  fill(255);//background(0);
  point(x,y);
  if(mc)
  {
    if(y+r>height||y-r<0)
    v*=-1;
    if(x+r>width||x-r<0)
    dx*=-1;
    if(frameCount%60 ==0 && !(dx==0))
    dx += (dx<0)? 0.04:-0.04;
    
    x+=dx;
    y+=v;
    v+=(v<0)?0.028:0.02;
    ellipse(x,y,2*r,2*r);
  } 
  
    stroke(230,107,156);
    line(x,y,mouseX,mouseY);
    strokeWeight(3);
    point(mouseX,mouseY);
  if (mousePressed == true)
  {
    mc = true;
  dx = (mouseX-x)*6/frameRate;
  v = (mouseY+56-y)*6/frameRate;
    
  }
}
/*
void mouseClicked()
{
  mc = true;
  dx = (mouseX-x)*6/frameRate;
  v = (mouseY-y)*6/frameRate;
}*/