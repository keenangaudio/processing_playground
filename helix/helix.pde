import peasy.*;
float h = 100, 
  r = h/2, 
  a = 0;
PeasyCam c;
void setup()
{
  size(600, 480, P3D);
  c = new PeasyCam(this, 100);
  fill(50, 100);
  background(0);
  stroke(255);
  strokeWeight(2);
  colorMode(HSB);
}
void draw()
{
  //ortho();
  int  inc = 5;
  int thic = 2;
  background(0);
  //noFill();

  rotateZ(a+=0.01);

  for (float i = 1; i<=inc; i++)
  {
    pushMatrix();
    beginShape(TRIANGLE_STRIP);
    rotateZ(i*TWO_PI/inc);
    //line(0,0,10,10);
    //text(i,10,10);
    for (float z = -h/2; z < h/2; z += 0.1 )
    {
      stroke(i*(z+(h/2))*255/(inc*h), 255, 255);
      fill(i*(z+(h/2))*255/(inc*h), 255, 255);
      float x = cos(z);
      float y = sin(z);
      PVector p = new PVector(x, y, z);
      p.setMag(r);
      vertex(p.x, p.y, p.z);

      x = cos(z+TWO_PI/(thic*inc));
      y = sin(z+TWO_PI/(thic*inc));
      p = new PVector(x, y, z);
      p.setMag(r);
      vertex(p.x, p.y, p.z);
    }
    endShape();
    popMatrix();
  }
}