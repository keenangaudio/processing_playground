int x , y , d , r, a = 0;
void setup(){
  size(500,600);
  x = width/2;
  y = height/2;
  r = 60;
  d = 2*r;
  noFill();
  stroke(255,175,175);
  strokeWeight(2);
}
void draw(){
  background(00);
  noFill();
  stroke(255,175,175);
  strokeWeight(2);
  a++;
  a = (a<360)? a : 0;
  curve(x+(d*sin(radians(a))),y+(2*r*cos(radians(a))),x+r,y+r,x+r,y-r,x+d*sin(radians(a)),y-2*r*cos(radians(a)));
  point(x+(d*sin(radians(a))),y+(2*r*cos(radians(a))));
  stroke(175,255,175);
  point(x+d*sin(radians(a)),y-2*r*cos(radians(a)));
}