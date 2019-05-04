void keyPressed()
{
  //println("Key pressed: " + key +" , "+ keyCode);
  grav.y += keyCode==UP? -1:(keyCode==DOWN? 1:0);
  grav.x += keyCode==LEFT? -1:(keyCode==RIGHT? 1:0);
  if (keyCode == 10 ) setup();
  if (keyCode == 'Z') Zclicked = !Zclicked;
  if (keyCode == 'G')    Gmode = !Gmode;
  if (keyCode == 'S')      SUN = !SUN;
  if (keyCode == 'D') solar = !solar; 
  if (mousePressed && keyCode == 8)
  { 
    balls = ball_contract(balls ,sel_ball); 
    sel_ball = balls.length-1;  
  }
}
void mouseClicked()
{
  if (!Zclicked)
  //  balls = ball_expand(balls,8,random(1,5));
  //else 
    for (int i = 0 ; i < 10; i++)
      balls = ball_expand(balls);
   
  println(balls.length);
  println(frameRate);
}
void mousePressed()
{
  if (Zclicked)
  {
    balls = ball_expand(balls,5,random(1,5));
    sel_ball = balls.length-1;
  }
  for (int i = 0;i<balls.length;i++)
    if (balls[i].hover())
      sel_ball = i;
}
void mouseReleased()
{
  PVector mouse = new PVector(mouseX,mouseY);
  float ang = atan2(Pmouse.x-mouse.x,Pmouse.y-mouse.y),
        mag = map((Pmouse.dist(mouse)),0,850,0,-15);
  //if (Zclicked)
  //  balls[balls.length-1].updateSpeed(ang,mag);

  if (sel_ball!=-1 && sel_ball<balls.length)
    balls[sel_ball].updateSpeed(ang,mag);
  sel_ball=-1;
  println("ANGLE: " + ang);
}
void mouseDragged()
{
  mouse.set(mouseX,mouseY);
  //line(Pmouse.x,Pmouse.y,mouse.x,mouse.y);
}
void mouseMoved()
{
  Pmouse.set(mouseX,mouseY);
}