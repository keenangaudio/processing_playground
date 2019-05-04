import java.util.Arrays;
part[] balls; part sun;
float  t = 0.25, gravity = 40;
Grav grav = new Grav(0,0);
boolean keyP = false,Zclicked = false ,Gmode = false, SUN = false, editMode = false,solar = false;
int sel_ball = -1;
PVector Pmouse = new PVector(0,0) , mouse = new PVector(0,0);
line l = new line();
void setup()
{
  float[] masses;
  noCursor();//cursor(CROSS);
  fullScreen(P2D);
  //size(700, 700);
  frameRate(240);
  balls =  new part[0];      
   masses =  new float[balls.length];
  for (int i = 0; i< balls.length; i++){
    balls[i] = new part();  //default constructor
    masses[i] = balls[i].mass;
  }
  Arrays.sort(masses);
  println(masses);
  textSize(16);
  text("j",width/2,height/2);
  createSun();
  l.create();
  //exit();
}

void draw () 
{
 // gravity = map(mouseY,0,height,-40,160);
  //background(0);
  l.update();
  strokeWeight(5);stroke(#FF67EE);
  point(mouseX,mouseY);
  
  if (mousePressed && Zclicked)    // PLACE BALL WITH SPEED
  {
    balls[balls.length-1].d.set(0,0);
    line(balls[balls.length-1].loc.x,balls[balls.length-1].loc.y,mouseX,mouseY);
  }
  if (sel_ball!=-1 && sel_ball<balls.length)
  {
    Pmouse.set(balls[sel_ball].loc);
    line(balls[sel_ball].loc.x,balls[sel_ball].loc.y,mouseX,mouseY);
  }
    
  if (!(keyPressed && key == 32) ) // NOT PAUSED
    frame();
  if (keyPressed && (key == 32||key == 'l'))
    for (part b : balls)
    {
      b.speedline();
     // b.forceline(); //very laggy for now
      b.path();
    }

  for (part b : balls)    //Always draw the balls and info,
  {
    strokeWeight(b.hover()? 2:5);
    b.drawball();
    b.hover();
  }
  if (SUN)
  {
    strokeWeight(sun.hover()? 2:5);
    sun.drawball();
    sun.hover();
  }
  
  fill(255);
  text(int(frameRate) + "\nGravity: " + "(" + grav.x() + "," + grav.y() + ")\nMode: " 
       + (Zclicked? "Big":"Small") + (Gmode? "\nGravity Sim":"\nBouncy Sim") + "\nParticles: " + balls.length + "\nInterGravity: " + gravity,40,40);
}
void frame()
{
  if (SUN) updateSun();
  //t = (map(mouseY,0,height,1.5,0.001));
  //int tempL = balls.length;
  for (int i = 0;i<balls.length;i++)
  {
    for (int j = 0;j<balls.length;j++)
    { if (i==j) continue;
      if (!(balls[i] == null || balls[j] == null))
      if (balls[i].diam + balls[j].diam >= 300 && !solar) 
      { 
       if(balls[i].isHit(balls[j]))
         balls[i].bounce(balls[j]); 
       continue;
      }
      if(Gmode && balls[i].isCluster(balls[j]) && !solar)
      {
        if (balls[i].rad>=balls[j].rad)
        {
          balls[i].combine(balls[j]);
          balls = ball_contract(balls,j);
          //println(balls.length);
        }else{
          balls[j].combine(balls[i]);
          balls = ball_contract(balls,i);
          //println(balls.length);
        }
      } 
      //if (j>=balls.length || i>=balls.length)break;
    }
    if (i>=balls.length)break;
  }  //*//*
    //println(balls.length);
  for (part b1 : balls)
  {
    //println(b1.d);
    b1.d.y += t*b1.mass*grav.y();
    b1.d.x += t*b1.mass*grav.x();
    b1.update();
    for(part b2: balls)
    { if (b1==b2) continue;
      if(Gmode && b1.isClose(b2,800))
         b1.gravity(b2,gravity);
      if(!Gmode && b1.isHit(b2))
         b1.bounce(b2);
    }
  }
}
void createSun()
{
  sun = new part(10,0);  //big, not moving
  sun.col.set(255,238,103); //yellow
  sun.loc.set(width/2,height/2);
}
void updateSun()
{
  sun.update();
  sun.mass = 10;
  for(part b1 : balls)
    {
      //if(b1.isHit(sun))
         //b1.bounce(sun); 
      if(Gmode && b1.isClose(sun,800))
         b1.gravity(sun,gravity);
    }
}

class Grav
{
  int x=0 ,y=0;
  Grav(float gx,float gy)
  {
    x = round(gx*100); //gx = 0.15 ==> x = 15
    y = round(gy*100);
  }
  Grav()
  {   
  }
  float x()
  {
    return x/100.0;
  }
  float y()
  {
    return y/100.0;
  }
}