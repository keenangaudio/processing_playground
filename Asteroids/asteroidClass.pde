class Asteroid
{
  PVector p, v;
  float v1 = random(5 ,10),      //  size
        v2 = random(0.2 , 1.2),      //  speed
        v3 = random(-5, 5),      //  Variances
       tcl = random(-0.05,0.05);
  float[] r;
  int  size, age;
  float col = random(255);
  boolean hit;
  Asteroid()
  {
    size = floor( random(5,10) );
    create();
  }
  Asteroid(int size_)
  {
    size = size_;
    create();
  }
  void create()
  {
    age = 0;
    p = new PVector();
    p = PVector.fromAngle(random(TWO_PI)).mult(random(1.1,2) * maxRadius);
    v = new PVector(p.x,p.y);
    v.normalize().add( PVector.random2D().mult(0.1) ).mult(-v2);
    r = new float[size];
    for(int i = 0; i < size ; i++ )
      r[i] = 10*size*random(0.5,1);
  }
  void update()
  {
    age++;
    checkHit();
    if (hit)
      children();
    else
    {
      p.add(v);
      showAsteroid();
    }
  }
  void showAsteroid()
  {
      stroke(col,200,200);
      pushMatrix();
      translate(p.x,p.y);
      rotate(frameCount*tcl);
      beginShape();
      for(int i = 0; i < size; i++)
        vertex(r[i]*cos(TWO_PI*i/size),r[i]*sin(TWO_PI*i/size));
      endShape(CLOSE);
      popMatrix();
  }
  boolean checkBounds()
  {
    if ( p.mag() >  3*maxRadius && age > 60) return true;
    return false;
  }
  void checkHit()
  {
     
  }

  void children()
  {
    
  }
}