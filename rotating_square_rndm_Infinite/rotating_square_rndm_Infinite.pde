  IntList x = new IntList(), y = new IntList(), t = new IntList(), n = new IntList(), d = new IntList(), rotd = new IntList();  
  //          calls the shape coordinates   &    colour counter   &  colour counter &  spinner count   &  rotation constant
  FloatList speed = new FloatList(), yspeed = new FloatList(), dia = new FloatList();           
  //                    starting X and Y speed           &         diameter
  int min = 4 , max = 14, c = 0,     rot_s = 3;      
  //  min  /  max speed & colour & rotation speed
  boolean draw = true;
void setup()
{

  //size(950,800);    // window
  fullScreen();     //no window
  //noCursor();
  background(random(100,150),random(100,150),random(100,150)); //nice random shade of gray + hue
 //framerate at 20fps slows down the animation
  frameRate(60);
}
void draw()
{
  if (draw == true){
  c = (c < 255) ? ++c : 0;
  colorMode(HSB);noStroke();fill(c,100,100,25); //background(c,100,100);
  rect(0,0,width,height);
  }
 for (int m = 0; m < x.size(); m++)  {
  //ocsillating size
   dia.set(m, 30*(1+sin(radians(n.get(m)))/2)); n.set(m, (n.get(m) < 360) ? n.get(m) + 3 : 0);   
   
   //inside window check for X
    if (((x.get(m)+(dia.get(m)/2)) > width) || ((x.get(m)-(dia.get(m)/2)) < 0)){
      speed.mult(m, -1);  //go backwards
      speed.set(m, (speed.get(m) > 0) ? speed.get(m)*random(0.9,1.1) : speed.get(m)*random(0.9,1.1));  //random bounces
      x.add(m,((int)(speed.get(m)/2)));  //get away from the wall
    }
    x.add(m,(int)speed.get(m));  //keep going
    
   //inside window check for Y
    if (((y.get(m)+(dia.get(m)/2)) > height) || ((y.get(m)-(dia.get(m)/2)) < 0)){
      yspeed.mult(m, -1);  //go backwards
      yspeed.set(m, (yspeed.get(m) > 0) ? yspeed.get(m)*random(0.9,1.1) : yspeed.get(m)*random(0.9,1.1));  //random bounces
      y.add(m,((int)(yspeed.get(m)/2)));  //get away from the wall
    }
    y.add(m,(int)yspeed.get(m));  //keep going
  
   //max speed check
    if (abs(speed.get(m)) > max)      speed.set( m, ( speed.get(m) > 0) ? (max*random(0.9,1)) : -max*random(0.9,1));
    if (abs(yspeed.get(m)) > max)    yspeed.set( m, (yspeed.get(m) > 0) ? (max*random(0.9,1)) : -max*random(0.9,1)); 
   //min speed check
    if (abs(speed.get(m)) < min)      speed.set( m, ( speed.get(m) > 0) ? (min*random(1,1.1)) : -min*random(1,1.1));
    if (abs(yspeed.get(m)) < min)    yspeed.set( m, (yspeed.get(m) > 0) ? (min*random(1,1.1)) : -min*random(1,1.1));  
    
    //noStroke();
    strokeWeight(2);
    //fill(random(250),random(20,80),random(255),random(150,255));
    colorMode(HSB); if (t.get(m)<255){fill(t.get(m),100,200);stroke(map(n.get(m),360,0,0,255),100,200);t.add(m,1);} else {t.set(m,0);fill(t.get(m),100,200);stroke(map(n.get(m),360,0,0,255),100,200);} //colorMode(RGB); 
  
   //draw shape
  noFill();
   ellipse(x.get(m),y.get(m),dia.get(m),dia.get(m));
   d.add(m, rotd.get(m));
   if (!(d.get(m) >= 270))  d.set(m,360);
      quad(x.get(m)+dia.get(m)*sin(radians(d.get(m)-270)),y.get(m)+dia.get(m)*cos(radians(d.get(m)-270)),x.get(m)+dia.get(m)*sin(radians(d.get(m)-180)),y.get(m)+dia.get(m)*cos(radians(d.get(m)-180)),
      x.get(m)+dia.get(m)*sin(radians(d.get(m)-90)),y.get(m)+dia.get(m)*cos(radians(d.get(m)-90)),x.get(m)+dia.get(m)*sin(radians(d.get(m))),y.get(m)+dia.get(m)*cos(radians(d.get(m))));
  /* //troubleshooting 
   textAlign(CENTER);
   text(m,x.get(m),y.get(m));
  */
 }
 /*troubleshooting section
  rectMode(CORNER);
  textAlign(CORNER);
  fill(200);
  rect(15,15,70,50,5);
  fill(0);
  textSize(18);
  text(x.size(),24,38);
  text(c,24,56);
  */
}


void mouseClicked(){
  if (mouseButton == LEFT){  //if left button clicked
    x.append(mouseX);
    y.append(mouseY);
    t.append(0);
    n.append(60);
    dia.append(0);
    d.append(0);
    rotd.append((random(1) > 0.5)? -rot_s: rot_s);
    speed.append(6*random(-1.1,1.1));
    yspeed.append(5*random(-1.1,1.1));
  } else draw = (draw == true)? false : true;
}