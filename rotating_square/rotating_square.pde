int x , y , i , dia , speed , yspeed, a , b , n;
final float constant = sqrt(3600);
void setup(){
  fullScreen();
  //size( 700, 500 );
  x = 100; y = 100;
  i = 360;  dia = 30;
  speed = 5;yspeed = 5;
  frameRate(75);
}
void draw(){
 //inside window check for X
  if (((x+(dia/2)) < width) && ((x-(dia/2)) > 0)){
    x += speed;  //keep going
  } else {
    speed *= -1;  //go backwards
    //speed = (speed > 0) ? speed + n*int(random(3)) : speed + n*int(random(3));
    x += speed;  //get away from the wall
  }
 //inside window check for Y
  if (((y+(dia/2)) < height) && ((y-(dia/2)) > 0)){
    y += (yspeed);  //keep going
  }  else  {
    yspeed *= -1;  //go backwards
    //yspeed = (yspeed > 0) ? yspeed + n*int(random(3)) : yspeed + n*int(random(3));
    y += yspeed;  //get away from the wall
  }
 //color changer
  colorMode(HSB);  if (n<255){fill(n++,100,200);} else {n=1;fill(n,100,200);} colorMode(RGB); 
 //spinner
  if (i >= 360){
      quad(x+dia*sin(radians(--i-270)),y+dia*cos(radians(i-270)),x+dia*sin(radians(i-180)),y+dia*cos(radians(i-180)),x+dia*sin(radians(i-90)),y+dia*cos(radians(i-90)),x+dia*sin(radians(i)),y+dia*cos(radians(i)));
  } else {
    i=450;
    quad(x+dia*sin(radians(--i-270)),y+dia*cos(radians(i-270)),x+dia*sin(radians(i-180)),y+dia*cos(radians(i-180)),x+dia*sin(radians(i-90)),y+dia*cos(radians(i-90)),x+dia*sin(radians(i)),y+dia*cos(radians(i)));
  }
}