class part
{
  boolean 
   hitAlready = false;
  int 
     hitCount = 0 ,
    pathCount = 0;
  float  diam = 6,//random(6,9),
          rad = diam/2,
         mass = rad*0.19;
  PVector col = new PVector(0,0,230),/*random(255),random(255),random(255)),//*/
            d = new PVector(((random(1)>0.5)? -1:1) * random(5,6) ,
                            ((random(1)>0.5)? -1:1) * random(5,6)),
          loc = new PVector(  random(diam, width-diam) ,
                              random(height/2,height-diam));
  PVector[] F = new PVector[0],
         path = new PVector[20]; //path length
  float 
     momentum = mass*d.mag();
  final 
   int BORDER = -256,
    NO_BORDER = -128;
  part(int size)
  {
    diam*=size;
    rad*=size;
    mass= rad*rad*0.05;
    col.set(random(240),random(240),random(240));
    loc.set(Pmouse.x,Pmouse.y);
    Arrays.fill(path,new PVector(loc.x,loc.y));
  }
  part(int size, float speed)
  {
    diam*=size;
    rad*=size;
    mass= rad*rad*0.05;
    col.set(random(240),random(240),random(240));
    
    loc.set( ((mouseX<rad)?rad+1:(mouseX> width-rad)? width-rad-1:mouseX),
             ((mouseY<rad)?rad+1:(mouseY>height-rad)?height-rad-1:mouseY) );
    d.setMag(speed);
    Arrays.fill(path,new PVector(loc.x,loc.y));
  }
  part() 
  {
    Arrays.fill(path,new PVector(loc.x,loc.y));
  }
  void updateSpeed(float angle,float mag)
  {
    d.set(sin(angle)*mag,cos(angle)*mag);
    println("UPDATED: " + d);
  }
  void create(part b2)
  {
    while (isHit(b2))
        loc = new PVector(random(diam, width-diam),random(height/2,height-diam));
    mass = rad*0.19;
  }
  void update()  /* this allows for each ball to update seperately, including it
                    in the class will mostly be useful if you use a ball array */
  {
    //if (frameCount%2==0){ d.mult(0.99); }
    d.limit(23);
    walls(BORDER); //NO_BORDER
    loc.add(d.mult(t));
    d.div(t); 
    path[pathCount].x =loc.x; path[pathCount].y =loc.y;
    pathCount++;
    if (pathCount+1<path.length) pathCount=0;
  }
  void drawball()
  {
    stroke(col.x,col.y,col.z);noFill();
    ellipse (loc.x, loc.y, diam, diam);
  }
  void speedline()
  {
    strokeWeight(2);
    line(loc.x,loc.y,loc.x+2*d.x,loc.y+2*d.y);
    strokeWeight(5);
  }
  void forceline() //fix so the forces update and correspond with the amount of balls
  {
    strokeWeight(2);
    int n = 1;
    for(PVector f : F)
    {
      stroke(map(n++,0,F.length,0,100));
      line(loc.x,loc.y,loc.x+4*f.x,loc.y+4*f.y);
    }
    strokeWeight(5);
  }
  void path()
  {
    stroke(col.x,col.y,col.z,100); strokeWeight(5);
    for(PVector p:path)
      point(p.x,p.y);
  }
  void combine(part b2)
  {
    println("i: " + diam + " j: " + b2.diam);
    diam += (b2.diam/2);
    println("i: " + diam);
    rad   = diam/2;
    mass  = rad*rad*0.05;
    col.lerp(b2.col,(b2.rad/rad));
     d .lerp( b2.d ,(b2.rad/rad));
  }
  void walls(int reaction)
  {
    switch (reaction)
    {
      case BORDER:
      {
        if(loc.x+rad >  width) loc.x =  width-rad;
        if(loc.x-rad < 0) loc.x = rad;
        if(loc.y+rad > height) loc.y = height-rad;
        if(loc.y-rad < 0) loc.y = rad;
        if(loc.x+rad >  width-1 || loc.x-rad < 1) d.x *= -1;
        if(loc.y+rad > height-1 || loc.y-rad < 1) d.y *= -1;
        break;
      }
      case NO_BORDER:
      {
        if(loc.x-rad > width) loc.x = 1;
        if(loc.x+rad < 0) loc.x = width-1;
        if(loc.y-rad > height) loc.y = 1;
        if(loc.y+rad < 0) loc.y = height-1;
        break;
      }
    }
  }
  boolean isHit(part b2)
  {
   //checks if it hits another ball and changes direction accordingly
   if (b2==null) return false;
   float Xdist = b2.loc.x-loc.x, 
         Ydist = b2.loc.y-loc.y,
         Tdist = sqrt((Xdist*Xdist) + (Ydist*Ydist));
     if (abs(Tdist) < b2.rad + rad && Tdist > 0.8*(rad+b2.rad)) // fix this
       return true;
   return false;
  }
  void bounce(part b2)
  {
    momentum = mass*d.mag();
    float dist = loc.dist(b2.loc), 
          angle = atan2(b2.loc.y-loc.y,b2.loc.x-loc.x),
          Tmome = b2.momentum + momentum;
          if (dist < rad*0.8 || dist < b2.rad*0.8) return; //if one is inside the other by alot, don't bounce
          //println(degrees(angle));
          d.set(-cos(angle)*(Tmome-(b2.momentum-momentum)/mass),  //X
                -sin(angle)*(Tmome-(b2.momentum-momentum)/mass)); //Y
  }
  boolean isClose(part b2,float maxdist)
  {  //checks if it is close another ball 
    if (b2==null) return false;
    float Xdist = b2.loc.x-loc.x, 
         Ydist = b2.loc.y-loc.y,
         Tdist = sqrt((Xdist*Xdist) + (Ydist*Ydist));
    if (abs(Tdist) < maxdist && Tdist > 1.1*(rad+b2.rad)) // <--needs attention
       return true;
    return false;
  }
  void gravity(part b2,float g)
  {
    float Xdist = b2.loc.x-loc.x, 
          Ydist = b2.loc.y-loc.y,
          dist = loc.dist(b2.loc),
          angle = atan2(Ydist,Xdist);
          //println(degrees(angle));
          F = exp_forces(F);
          F[F.length-1].set(cos(angle)*(g*mass*b2.mass/(dist*0.5*dist)),sin(angle)*(g*mass*b2.mass/(dist*0.5*dist)));
          d.add(cos(angle)*(g*mass*b2.mass/(dist*0.5*dist)),sin(angle)*(g*mass*b2.mass/(dist*0.5*dist))); 
  }
  boolean isCluster(part b2)
  {
    if (b2==null) return false;
    float dist = loc.dist(b2.loc);
    if (dist < rad*0.8 || dist < b2.rad*0.8) 
      return true;
    return(false);

  }
  boolean hover()
  {
    PVector mouse = new PVector(mouseX,mouseY);
    float    dist = loc.dist(mouse);
    if (abs(dist)<rad){
      displayInfo();
      return true;
    }
    return false;
  }
  void displayInfo()
  {
    strokeWeight(1);
    float tx = mouseX,ty = mouseY;
    ty += (ty+80>height)? -100:0;
    tx += (tx+200>width)? -200:0;
   textSize(16);
   fill(255);
   rect(tx,ty,200,100); 
   fill(0);
   text("(" + loc.x + "," + loc.y + ")\n(" + d.x + "," + d.y + ")\n Mass: " + mass + "\nRad: " + rad,tx,ty+16);   
  }
  PVector[] exp_forces(PVector[] f)
  {
    PVector[] newf = new PVector[f.length+1];
    for(int i = 0; i<f.length;i++)
      newf[i] = f[i];
    newf[f.length] = new PVector();
    return newf;
  }
} 
part[] ball_contract(part[] balls ,int index)
{
  if (index>=balls.length) index = balls.length-1;
  part[] b1 = new part[balls.length-1];
  for (int i = 0 ; i < index ; i++)
  {
    b1[i] = balls[i];
  }
  for (int i = index+1 ; i < balls.length ; i++)
  {
    b1[i-1] = balls[i];
  }
  println(balls.length);
//  for (part b2 : balls) balls[balls.length - 1].create(b2);
  return b1;
}
part[] ball_expand(part[] balls ,int size, float speed)
{
  part[] b1 = new part[balls.length+1];
  for (int i = 0 ; i < balls.length ; i++)
  {
    b1[i] = balls[i];
  }
  b1[balls.length] = new part(size,speed);
  for (part b2 : balls) b1[balls.length - 1].create(b2);
  return b1;
}
part[] ball_expand(part[] balls )
{
  part[] b1 = new part[balls.length];
  for (int i = 0 ; i < balls.length ; i++)
  {
    b1[i] = balls[i];
  }
  balls = new part[balls.length + 1];
  for (int i = 0 ; i < b1.length ; i++)
  {
    balls[i] = b1[i];
  }
  balls[balls.length - 1] = new part();
  for (part b2 : balls) balls[balls.length - 1].create(b2);
  return balls;
}