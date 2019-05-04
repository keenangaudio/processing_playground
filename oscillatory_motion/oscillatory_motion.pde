int x , y , d , h, w, a = 0;
void setup(){
  size(800,600);
  //fullScreen();
  noCursor();
  //x = width/2;
  y = height/2;
  h = height*3;
  d = width/5;//60;
  w = d;
  noFill();
  stroke(255,175,175);
  strokeWeight(2);
  //frameRate(12);
}
void draw(){
  frameRate(35);
  background(0);
  noFill();
  stroke(231,124,149);
  strokeWeight(5);
  a++;
  a = (a<=360)? a : 0;
  for(int x = -d;x<width+d;x+=2*d){
    curve(x-w*abs(cos(radians(a))),y+h*sin(radians(a)),x,y,x+d,y,x+d+w*abs(cos(radians(a))),y+h*sin(radians(a)));

    curve(x+d-w*abs(cos(radians(a))),y-h*sin(radians(a)),x+d,y,x+2*d,y,x+(2*d)+w*abs(cos(radians(a))),y-h*sin(radians(a)));

  }
}