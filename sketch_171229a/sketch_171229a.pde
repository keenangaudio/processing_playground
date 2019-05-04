float r = 16, r1 = r*cos(PI/4);
void setup()
{
  size(400,400);
 
  stroke(255);
  strokeWeight(3);
 
  
}
void draw()
{
   background(0);
  translate(width/2,height/2);
  
  rotate(atan2(mouseY-height/2,mouseX-width/2));
  //vertex(0,0);
  beginShape();
    vertex(r,0);
    vertex(-r1, r1);
    vertex(-0.3*r,0);
    vertex(-r1,-r1);
  endShape(CLOSE);
}