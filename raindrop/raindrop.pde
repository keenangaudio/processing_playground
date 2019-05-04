drop[] drops = new drop[10];
int dropCount;
void setup()
{
  size(1300, 800);
  noFill();
  stroke(255);
}
void draw()
{
  //background(0);
  fill(0, 50);
  rect(-1, -1, width+2, height+2);
  for (drop d : drops)
    if (d!=null)
      d.update();
}
void mousePressed()
{
  drops[dropCount%drops.length] = new drop(mouseX, mouseY);
  dropCount++;
}
class drop
{
  PVector loc;
  vertex[] v = new vertex[60];
  float r = 0;
  drop(float x, float y)
  {
    loc = new PVector(x, y);
    for (int i = 0; i< v.length; i++)
    {
      float rad = i/(v.length/TWO_PI);
      v[i] = new vertex(loc.x, loc.y, rad);
    }
  }
  void update()
  {
    r++;
    noFill();
    beginShape();
    for (int i = 0; i< v.length; i++)
    {
      //float rad = i*v.length/TWO_PI;
      curveVertex(v[i].loc.x, v[i].loc.y);
      v[i].update(v);
    }
    endShape(CLOSE);
  }
}
class vertex
{
  PVector speed;
  PVector loc = new PVector();
  int life = 0;
  vertex(float x, float y, float rad)
  {
    loc.set(x, y);
    speed = new PVector(cos(rad), sin(rad));
    //speed.mult(1);
  }
  void update(vertex[] v)
  {
    // check(v);
    life++;
    loc.add(speed);
    check(v);
  }
  void check(vertex[] v)
  {
    if (loc.x>width || loc.x< 0)
      speed.x*=-1;
    if (loc.y>height || loc.y< 0)
      speed.y*=-1;
    for (vertex other : v)
      if (other!=this)
      {
        float dist = this.loc.dist(other.loc);
        if (dist < (life-1>4?3:0) && speed.dot(other.speed)<0 )//v.length/(TWO_PI*(life!=0?life-1:life))
          speed.add(other.speed).mult(0.5);
      }
  }
}