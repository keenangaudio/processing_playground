boolean left , right;
int x , y , i , dia , speed , yspeed;
//final float constant = sqrt
void setup(){
  //fullScreen();
  size( 700, 500 );
  x = 100; y = 100;
  i = 0;  dia = 40;
  speed = 5;yspeed = 5;
  
}
void draw(){
  //inside window check for X
  if (((x+(dia/2)) < width) && ((x-(dia/2)) > 0)){
    x += speed;  //keep going
  } else {
    speed *= -1;  //go backwards
    x += speed;  //get away from the wall
  }
  
 //inside window check for Y
  if (((y+(dia/2)) < height) && ((y-(dia/2)) > 0)){
    y += (yspeed);  //keep going
  }  else  {
    yspeed *= -1;  //go backwards
    y += yspeed;  //get away from the wall
  }
  translate(x,y);
  background(200);
  if (i < 360){
    rotate(radians(i++));
  }else {
    i=0;
  }
  rectMode(CENTER);
  rect(0,0,dia,dia);
  x+= speed; y+= yspeed;
}