int x , y , d , h, n, c, b;
void setup(){
  //size(600,900);
  fullScreen();
  noCursor();
  x = width/2;
  y = height/2 -12+ (int)random(0,24);
  h = height/3;
  d = width/9;//60;
  frameRate(35);
  noFill();
  stroke(231,124,149);
  stroke(124,231,127);
  //strokeWeight(25);
}
void draw(){
  //y = height/2 -12+ (int)random(0,24);
  frameRate(35+10*abs(sin(radians(c))));
  fill(0,10);  noStroke();
  rect(0,0,width,height);
  noFill();
  strokeWeight(5+25*abs(sin(radians(c))));
  colorMode(HSB);  if (n<255){stroke(n++,100,200);} else {n=1;stroke(n,100,200);} colorMode(RGB); 
  //background(0);
  c++;
  c = (c<360)? c : 0;
  beginShape();
      curveVertex(0,y);
      curveVertex(x-5*d-b,y+curveY(6));
      curveVertex(x-4*d-b,y-curveY(5));
      curveVertex(x-3*d-b,y+curveY(4));
      curveVertex(x-2*d-b,y-curveY(3));
      curveVertex(x-d-b,y+curveY(2));
      curveVertex(x,y-curveY(1));
      curveVertex(x+d+b,y+curveY(2));
      curveVertex(x+2*d+b,y-curveY(3));
      curveVertex(x+3*d+b,y+curveY(4));
      curveVertex(x+4*d+b,y-curveY(5));
      curveVertex(x+5*d+b,y+curveY(6));
      curveVertex(width,y);
  endShape();
}
float curveY(int i)
{
  return (-h/(pow((i+0.2),sqrt(2))))*sin(3*tan(radians(c-(i-1)*2)));
}
/*for(int a = -d; a<(width/3*d);a++)
      curveVertex((a++)*d,y-h*sin(radians(c)));
      curveVertex((a)*d,y+h*sin(radians(c)));*/