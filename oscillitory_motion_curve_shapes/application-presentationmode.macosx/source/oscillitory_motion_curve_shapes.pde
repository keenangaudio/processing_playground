int x , y , d , h, w, c;
void setup(){
  //size(800,600);
  fullScreen();
  noCursor();
  x = width/2;
  y = height/2;
  h = height/3;
  d = width/9;//60;
  w = d;
  frameRate(35);
  noFill();
  stroke(231,124,149);
  stroke(124,231,127);
  strokeWeight(5);
}
void draw(){
  //frameRate(35);
  background(0);
  c++;
  c = (c<360)? c : 0;
  beginShape();
      curveVertex(0,y);
      curveVertex(x-5*d,y+(h/16)*sin(radians(c)));
      curveVertex(x-4*d,y-(h/9)*sin(radians(c)));
      curveVertex(x-3*d,y+(h/5)*sin(radians(c)));
      curveVertex(x-2*d,y-(h/3)*sin(radians(c)));
      curveVertex(x-d,y+(h/2)*sin(radians(c)));
      curveVertex(x,y-h*sin(radians(c)));
      curveVertex(x+d,y+(h/2)*sin(radians(c)));
      curveVertex(x+2*d,y-(h/3)*sin(radians(c)));
      curveVertex(x+3*d,y+(h/5)*sin(radians(c)));
      curveVertex(x+4*d,y-(h/9)*sin(radians(c)));
      curveVertex(x+5*d,y+(h/16)*sin(radians(c)));
      curveVertex(width,y);
  endShape();
}
/*for(int a = -d; a<(width/3*d);a++)
      curveVertex((a++)*d,y-h*sin(radians(c)));
      curveVertex((a)*d,y+h*sin(radians(c)));*/