class Particle
{
  PVector loc;
  PVector speed;
  PVector acc;
  PVector[] Ploc = new PVector[10];
  float maxSpeed = 5, lastspec = 0;
  int num = 0;
  int index = num%bands;//floor(random(0,bands));
  Particle()
  {
    loc = new PVector(0,0,0);
    PlocSet();
    speed = new PVector(0,0,0);
    acc = new PVector(0,0,0);
  }
  Particle(PVector p,int i)
  {
    num = i;
    loc = new PVector(p.x,p.y,p.z);
    speed = new PVector(0,0,0);
    acc = new PVector(0,0,0);
    PlocSet();
  }
  void update()
  {
    //int[] x = grid();
    speed.add(acc);
    acc.mult(0);
    speed.limit(maxSpeed);
    
    loc.add(speed); 
    //loc.setMag(r);
    locConstrain(r + 80*(spec[index]-lastspec));
    //loc.setMag(r + 40*(spec[index]-lastspec));
    //loc.setMag(p[x[0]][x[1]].mag());
    lastspec = spec[index];
    display();
    Ploc();
  }
  void force(PVector f) 
  {
    acc.add(f);
    //acc.add(PVector.random3D().mult(2));
  }
  void locConstrain(float a)
  {
    PVector p1 = loc.copy();                        //where it is
    PVector p2 = loc.copy().normalize().mult(a);    //where it should be
    PVector tmp = p2.sub(p1);
    force(tmp.mult(4));
  }
  void Ploc()
  {
    for (int i = 0; i < Ploc.length-1; i++)
      Ploc[i] = Ploc[i+1];
    Ploc[Ploc.length-1] = loc.copy();
  }
  void PlocSet()
  {
    for (int i = 0; i < Ploc.length; i++)
      Ploc[i] = loc.copy();
  }
  void display()
  {
    
    int[] x = grid();
    //for (int i = 0; i < Ploc.length; i+=2){
    //  pushMatrix();
    //  translate(Ploc[i].x,Ploc[i].y,Ploc[i].z);
    
    //  float r_ = map(i,0,Ploc.length,0,8);
    //  sphere(r_);
    //  popMatrix();
    //}
    
    beginShape();
    for (int i = 0; i < Ploc.length; i+=2)
      curveVertex(Ploc[i].x,Ploc[i].y,Ploc[i].z);
    curveVertex(loc.x,loc.y,loc.z);
    endShape();
    stroke(map(x[0]+x[1],0,res*res,0,255));
    point(loc.x,loc.y,loc.z);
  // popMatrix();
  }
  int[] grid()
  {
    PVector Z = new PVector (0,0,1);
    PVector Y = new PVector (0,1,0);
    
    float lon = PVector.angleBetween(Z,loc);   // z axis
    float lat = PVector.angleBetween(Y,loc);   // y axis
    //if (loc.x<0) lon+=PI;
    int ilat = int(map(lat,PI,0,0,res));       // y axis
    int ilon = int(map(lon,0,TWO_PI,0,res-1)); // z axis
 
    int[] x = {ilon,ilat};
      //lon = PVector.angleBetween(Z,loc.copy().add(speed));   // z axis
      //lat = PVector.angleBetween(Y,loc.copy().add(speed));   // y axis
    //if (loc.x<0) lon+=PI;
      //ilat += int(map(lat,PI,0,0,res));       // y axis
      //ilon += int(map(lon,0,TWO_PI,0,res-1)); // z axis
    //ilat/=2;
    //ilon/=2;
    //ONLY RUN THESE ON noLoop(); !!
    //println("-------" + num + "-------");
    //println(lat,lon);
    //println(x[0],x[1]);
    return x;
  }
  void move()
  {
    int[] x = grid();
    force(v[x[0]][x[1]].copy().mult(0.3));
  }
  void collide(Particle b)
  {
    
    if (b==this || loc.dist(b.loc)>1) 
      return;
    loc = PVector.random3D();
    loc.setMag(r);
    PlocSet();
    //loc.sub(speed);
  }
}
