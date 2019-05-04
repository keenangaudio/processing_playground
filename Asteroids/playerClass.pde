class Player
{
  PVector p;
  PShape ship;
  float r = 16, 
       r1 = r*cos(PI/4),
      vel = 5;
  
 Player()
 {
   p = new PVector(0,0);
   ship = createShape();
   createShip(ship, 16);
 }
 void update()
 {
   move();
   
   pushMatrix();
   ship.resetMatrix();
   ship.rotate(atan2(mouseY - height/2 - p.y,mouseX - width/2 - p.x));
   shape(ship, p.x, p.y);
   popMatrix();
 }
 void move()
 { 
   PVector v = new PVector();
     if (keysDown[0] == true)  v.x -= vel;
     if (keysDown[1] == true)  v.x += vel;
     if (keysDown[2] == true)  v.y -= vel;
     if (keysDown[3] == true)  v.y += vel;
   p.add(v);
   bounds();
 }
 void bounds()
 {
   if (p.x > width/2)   p.x = -width/2;
   if (p.y > height/2)  p.y = -height/2;
   if (p.x < -width/2)  p.x = width/2;
   if (p.y < -height/2) p.y = height/2;
   
 }
 void createShip(PShape s, float r)
 {
  s.beginShape();
    s.vertex(r,0);
    s.vertex(-r1, r1);
    s.vertex(-0.3*r,0);
    s.vertex(-r1,-r1);
  s.endShape(CLOSE);
  s.setStroke(255);
 }
}

class Bullet
{
  PVector p, v;
  float speed = 4;
  int age;
  Bullet()
  {
    create(0,0);
  }
  Bullet(PVector parent)
  {
     create(parent.x, parent.y);
  }
  void create(float x_, float y_)
  {
    age = 0;
    p = new PVector(x_,y_);
    v = new PVector(mouseX-width/2,mouseY-height/2);
    v.sub(p).normalize().mult(speed);
    p.add( v.copy().normalize().mult(10) );
  }
  void update()
  {
    age++;
    checkBounds();
    
    p.add(v);
    
    fill(#ffff00);
    noStroke();
    
    ellipse(p.x,p.y,4,4);
    ellipse(p.x-v.x,p.y-v.y,2,2);
    ellipse(p.x-2*v.x,p.y-2*v.y,1,1);
    
    noFill();
  }
  boolean checkBounds()
  {
    if ( p.mag() >  maxRadius && age > 60) return true;
    return false;
  }
}