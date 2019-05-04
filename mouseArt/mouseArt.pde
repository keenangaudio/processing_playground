mouse m;
//bug b = new bug();
PVector gravity = new PVector(0, 2);
void setup()
{
  size(500, 500);
  m = new mouse(30);
  noStroke();
  fill(255);
  noCursor();
}
void draw()
{
  background(250);
  //b.update();
  m.update();
  m.show();
}
class mouse
{
  PVector[] loc;
  part[] parts = new part[50];
  mouse(int s)
  {
    loc = new PVector[s];
    for (int i = 0; i < s; i++)
    {
      loc[i] = new PVector(mouseX, mouseY);
    }
    for (int i = 0; i < parts.length; i++)
    {
      parts[i] = new part(1, 30, this.loc[0]);
    }
  }
  void update()
  {
    for (int i = loc.length-1; i > 0; i--)
    {
      loc[i].x = loc[i-1].x;
      loc[i].y = loc[i-1].y;
    }

    loc[0].x = mouseX;
    loc[0].y = mouseY;
    //loc[0].x = b.loc.x;
    //loc[0].y = b.loc.y;

    for (part p : parts)
    {
      if (p.life == 0)
        p = new part(1, 30, this.loc[0]);
      else
        p.update();
    }
  }
  void show()
  {
    for (int i = 0; i < loc.length; i++)
    {
      ellipse(loc[i].x, loc[i].y, 5*sin(i*0.1), 5*sin(i*0.1));
    }
  }
}
class part
{
  PVector loc = new PVector(0, 0);
  PVector speed = new PVector(0, 0);
  PVector acc = new PVector(0, 0);
  int life;
  int maxLife;
  float mass;
  color c;
  float r = random(0.4, 3);

  part(float m, int l, PVector follow)
  {
    c = color(random(#FFFFFF));
    life = int(random(0.85*l, 1.15*l));
    maxLife = life;
    loc = follow.add(PVector.random2D());
    speed.set(PVector.random2D().mult(6));
    mass = m;
  }
  void update()
  {
    applyForce(gravity);
    life--;
    speed.add(acc);
    //acc.set(0, 0);
    loc.add(speed);

    if (life<0.7*maxLife)
    {
      r*=0.8;
      maxLife = life;
    }

    this.show();
  }
  void applyForce(PVector F)
  {
    acc.add(F.copy().mult(1/this.mass));
  }
  void show()
  {
    fill(c);
    ellipse(loc.x, loc.y, 2*r, 2*r);
  }
}
class bug
{
  PVector loc = new PVector(mouseX,mouseY); 
  PVector speed = new PVector(0,0);
  void update()
  {
    speed.add(PVector.fromAngle(noise(loc.x*3,loc.y*3)));
    loc.add(speed.mult(0.5));
    ellipse(loc.x,loc.y,4,4);
  }
  
}
