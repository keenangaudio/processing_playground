float x, y, dx, dy;  //x,y and respective speeds
float a = 0, t = 0;  //angle and timer
float r = 20, arad;  //radius and angle in radians
float t_r =20;
PVector[] v = new PVector[4]; 
final float s2 = (sqrt(2));
void setup(){
  size(500,500);
  x = width/2;
  y = height/2;
  scale(2);
  for(int i = 0;i<v.length; i++)
  v[i] = new PVector();
  dx = 3.3;  //3*random(0.9,1.1);  
  dy = 3;  //3*random(0.9,1.1);
}
void draw(){
  background(#F70798);
  a += (a <= 360)? 1: -360;
  arad = radians(a);
  t_r = r+abs(-3*s2*cos(arad))/2;
  v[0].x = x-r/2*s2+s2*r*sin(arad);   v[0].y = y-r/2*s2+s2*r*sin(arad);
  v[1].x = x+r;             v[1].y = y+r;
  v[2].x = x-r;             v[2].y = y-r;
  v[3].x = x+r/2*s2-s2*r*sin(arad);   v[3].y = y+r/2*s2-s2*r*sin(arad);
  stroke(0);  strokeWeight(3);  noFill();
  curve(v[0].x,v[1].y,v[1].x,v[1].y,v[1].x,v[2].y,v[0].x,v[2].y);//right
  curve(v[2].x,v[0].y,v[2].x,v[1].y,v[1].x,v[1].y,v[1].x,v[0].y);//bottom
  curve(v[2].x,v[3].y,v[2].x,v[2].y,v[1].x,v[2].y,v[1].x,v[3].y);//top
  curve(v[3].x,v[1].y,v[2].x,v[1].y,v[2].x,v[2].y,v[3].x,v[2].y);//left
  stroke(#46E345);
  //point(x+t_r,y);point(x-t_r,y);point(x,y+t_r);point(x,y-t_r);
  /*for (int i = 0;i<v.length;i++){
    for (int m = 0;m<v.length;m++){
      stroke(map(i,0,v.length,0,255),map(m,0,v.length,0,255),120);
      fill(map(i,0,v.length,0,255) , map(m,0,v.length,0,255),120);  
      text("i="+i,30+abs(i)*30,30);  text("m="+m,30+abs(m)*30,60);
      point(v[i].x,v[m].y);  text(i+":"+m,v[i].x,v[m].y);
    }
  }*/
  if (x+t_r>= width || x-t_r<=0){
    dx *= -1;  //x = (x+t_r>= width || x-t_r<=0)? width-1 : 1;
  }  
  if (y+t_r>= height || y-t_r<=0){
    dy *= -1;  //y = (y+t_r>= height || y-t_r<=0)? height-1 : 1;
    
  }
  x+=dx;  y+=dy;
  //text(a,width/2,height/2);
}