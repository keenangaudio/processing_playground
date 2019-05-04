  int x; int y;                          //calls the shape coordinates
  float dia; int n = 60;                          //initialize shape diameter
  int min = 4;  int max = 14;            //maximum speed
  float speed = 6*random(0.9,1.1);      //starting X speed (plus some randomness)
  float yspeed = 5*random(0.9,1.1);     //starting Y speed (plus some randomness)
  boolean up = true;                            //starts the shape getting bigger
  int t=0, d = 0,delay = 0;                        //random +- and spinner
  int minsize = 20;  int maxsize = 70;   //shape max and min diameter
  PVector col = new PVector(random(100,150),random(100,150),random(100,150));
void setup()
{
  size(950,800);    // window
  //fullScreen();     //no window
  noCursor();
  background(random(100,150),random(100,150),random(100,150)); //nice random shade of gray + hue
  colorMode(HSB);
 //randomly place the shape
  x = int(random(width));   
  y = int(random(height));
 //framerate at 20fps slows down the animation
  frameRate(30);
}
void draw()
{
   //background(t,100,100);
 //ocsillating size
 dia = 30*(1+sin(radians(n))/2); n = (n < 360) ? n + 3 : 0;
  
 //inside window check for X
  if (((x+(dia/2)) > width) || ((x-(dia/2)) < 0)){
    speed *= -1;  //go backwards
    speed = (speed > 0) ? speed*random(0.9,1.1) : speed*random(0.9,1.1);  //random bounces
    x += (speed/2);  //get away from the wall
  }
  
  x += speed;  //keep going
  
 //inside window check for Y
  if (((y+(dia/2)) > height) || ((y-(dia/2)) < 0)){
    yspeed *= -1;  //go backwards
    yspeed = (yspeed > 0) ? yspeed*random(0.9,1.1) : yspeed*random(0.9,1.1); //random bounces
    y += (yspeed/2);  //get away from the wall
  }  
  
  y += (yspeed);  //keep going

 //max speed check
  if (abs(speed) > max)      speed = ( speed > 0) ? (max*random(0.9,1)) : -max*random(0.9,1);
  if (abs(yspeed) > max)    yspeed = (yspeed > 0) ? (max*random(0.9,1)) : -max*random(0.9,1); 
 //min speed check
  if (abs(speed) < min)      speed = ( speed > 0) ? (min*random(1,1.1)) : -min*random(1,1.1);
  if (abs(yspeed) < min)    yspeed = (yspeed > 0) ? (min*random(1,1.1)) : -min*random(1,1.1);  
  
  //noStroke();
  strokeWeight(2);
  colorMode(HSB); if (t<255){fill(t++,100,200);stroke(map(n,360,0,0,255),100,200);} else {t=1;fill(t,100,200);stroke(map(n,360,0,0,255),100,200);} //colorMode(RGB); 

 //draw shape
 ellipse(x,y,dia,dia); 
 noFill();
  d = d - 3;
  if (!(d >= 360)){d=450;}
  
 //quad(x+dia*sin(radians(d-270)),y+dia*cos(radians(d-270)),x+dia*sin(radians(d-180)),y+dia*cos(radians(d-180)),x+dia*sin(radians(d-90)),y+dia*cos(radians(d-90)),x+dia*sin(radians(d)),y+dia*cos(radians(d)));
 
 //speedometer(); //for troubleshooting
}
void mouseClicked(){
  if (mouseButton == LEFT){  //if left button clicked
    speed = (speed > 0) ? speed+1 : speed-1;  //increase speed magnitude for X
    yspeed = (yspeed > 0) ? yspeed+1 : yspeed-1; //increase speed magnitude for Y
  } else {  //if right button clicked
    speed = (speed > 0) ? speed-1 : speed+1;  //decrease speed magnitude for X
    yspeed = (yspeed > 0) ? yspeed-1 : yspeed+1;  //decrease speed magnitude for Y
  }
}
void speedometer()  //for troubleshooting
{
  rectMode(CORNER);
      fill(col.x,col.y,col.z);
      rect(15,15,70,50,5);
      fill(0);
      textSize(18);
      text("X: " + nfp(int(speed),2),24,38);
      text("Y: " + nfp(int(yspeed),2),24,58);
}