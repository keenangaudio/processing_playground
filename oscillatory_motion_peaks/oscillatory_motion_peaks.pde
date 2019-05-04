int d , h, n, w, a = 0,a2,r;
float h2,t,x,y; boolean up = true;
void setup(){
  //size(800,600);
  fullScreen();
  noCursor();
  y = height/2;
  h = height/15;
  d = width/7;//60;
  n = 0; w = d; t = 0; r = 0;
  h2 = 0;
  background(0);
  colorMode(HSB);
}
void draw(){
  frameRate(60);
  //fill(0,25);  noStroke();
  //rect(0,0,width,height);
  background(0);
  n = (n<1024)? ++n : 0; stroke(n/4,100,200);
  strokeWeight(1.5 + 1*(sin(PI*cos(radians(a++/2))))); noFill();
  t += tval(0);
  r = (r<=720)? r : 0; ++r;
  a = (a<=360)? a : 0;
  h2 = h2val(0);
  drawShape();
  //troubleshoot();
}
void drawShape()
{
  beginShape();
  vertex(0-2*d,y);
    for (int x = -2*(d) ;x < width+2*d; x+=2*d)
    {
     a2 = abs((x-width/3)); map(a2,0,width/2,1,d); //bigger in the middle left
     //tshoot(x); 
      curveVertex(x+t ,y +curveY(0,false));
      curveVertex((x)+d+t,y -+curveY(0,true));
    }
    vertex(width +2*d,y);
  endShape();
}
float curveY(int i,boolean cos)  //i is displacement
{
  if (cos)
  return ((h*(h2val(i)/a2)*cos(radians(a-i))));
  else
  return ((h*(h2val(i)/a2)*sin(radians(a-i))));
}
float tval(int i)   //i is displacement
{
  return 2*sin(2*cos(radians((r-i)/2)));
}
float h2val(int i)
{
  return 45+10*sin((radians((r-i)/2)));
}