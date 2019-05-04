IntList x = new IntList(); float n =0;
int a = 0,r = height/3, t = 0, b=0;

void setup(){
  size(displayWidth,200);
  //fullScreen();
}
void draw(){
  strokeWeight(3);stroke(#D609C2);
  colorMode(HSB);  n += (n<=511)? 1:-512;{background(n/2,100,200);} colorMode(RGB); 
//background(255);
  translate(width/7,height/2);
  a += (a <= 360)? 1: -360;
  b += (b <= 4)? 1 : 0;
  x.append(t++);
  noFill();
  beginShape();
  for (int i = 0; i<x.size();i++){
    if (x.get(i) <=width)
    curveVertex(x.get(i),wave(a-i));
  }
  endShape();
  strokeWeight(b);stroke(#FF5596);
  point(0,wave(a));
  ellipse(mouseX-(width/7),wave(a-(mouseX-width/7)),20,20);
}
float wave(float a)
{
  return r*sin(3*tan(radians(a)));
}