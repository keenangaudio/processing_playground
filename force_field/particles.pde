class Particle
{
  PVector loc;
  PVector speed;
  PVector acc;
  PVector prevLoc1;
  PVector prevLoc2;
  PVector prevLoc3;
  float maxSpeed = 15;
  float w = 0.065;
  int col = round(random(25,75));
  Particle()
  {
    loc = new PVector(random(width),random(height),0);
    locset();
    speed = new PVector(0,0);//random(15),random(15));
    acc = new PVector(0,0,0);
  }
  Particle(PVector p)
  {
    loc = new PVector(p.x,p.y);
    locset();
    speed = new PVector(0,0);
    acc = new PVector(0,0);
  }
  void update()
  {
    speed.add(acc);
    speed.limit(maxSpeed);
    loc.add(speed); 
    acc.mult(0);
    
  }
  void force(PVector f,float a) {
    acc.add(f.copy().normalize().mult(a));
  }
  void force(PVector f) {
    acc.add(f.copy().normalize());
  }
  void display()
  {
    try {
    if (!line) {
    stroke(200,alpha);//alpha
    if (hue) col();
    strokeWeight(0.04);//2*w);
    line(loc.x,loc.y,prevLoc3.x,prevLoc3.y);
    }
    else  {
      int i = floor(loc.x/gridStepX);
      int j = floor(loc.y/gridStepY);
      line(loc.x,loc.y,loc.x+grid[i][j].x,loc.y+grid[i][j].y);
    }
    locUpdate();
    } catch (Exception e) {
      //println(e.getMessage());
    }
    //point(loc.x,loc.y);
    //curve(loc.x,loc.y,prevLoc1.x,prevLoc1.y,prevLoc2.x,prevLoc2.y,prevLoc3.x,prevLoc3.y);
  }
  void col()
  {
    col = (col>255)? 0 : ++col;
    colorMode(HSB);
    float c = map(col,0,255,250,100);
    stroke(col,c,350-c,alpha);
  }
  void move()
  {
    //force(new PVector(0,0.001));
    //force(speed.copy(),-0.075);
    int i = floor(loc.x/gridStepX);
    int j = floor(loc.y/gridStepY);
    try{
    force(grid[i][j],5);
    }catch(Exception e){}
    
    //force(PVector.random2D());
    //force(grid[i][j+1],0.25);
    //force(grid[i+1][j],0.2);
    //force(grid[i+1][j+1],0.2);
  }
  void locUpdate()
  {
    prevLoc3 = prevLoc2.copy();
    prevLoc2 = prevLoc1.copy();
    prevLoc1 = loc.copy();
  }
  void locset()
  {
    prevLoc1 = loc.copy();
    prevLoc2 = loc.copy();
    prevLoc3 = loc.copy();
  }
  void collide(Particle b)
  {
    if (loc.dist(b.loc)<=2*w && speed.copy().normalize().dot(b.speed.copy().normalize())<0)
    {
      PVector disp = loc.copy().sub(b.loc),
            spdiff = speed.copy().sub(b.speed);
      float   proj = spdiff.dot(disp)/disp.magSq();
      PVector temp = disp.mult(proj);
      speed = speed.copy().sub(temp);
      //println(loc,speed,acc);
    }
  }
  void walls()
  {
    if (loc.x+w>width){
      loc.x = 0;
      loc.y = random(height);
      locset();
    }
    if (loc.x<w){ 
      loc.x = width;
      loc.y = random(height);
      locset();
    }
    if (loc.y+w>height){
      loc.y = 0;
      loc.x = random(width);
      locset();
    }
    if (loc.y<w){ 
      loc.y = height;
      loc.x = random(width);
      locset();
    }
  }
  void bounce()
  {
    if (loc.x+w>width || loc.x<w) {
      locset();
      speed.x*=-1;
      if (loc.x+w>width) loc.x = width-w;
      if (loc.x<w)     loc.x = w;
    }
    if (loc.y+w>height || loc.y<w) {
      locset();
      speed.y*=-1;
      if (loc.y+w>height) loc.y = height-w;
      if (loc.y<w)      loc.y = w;
    }
  }
}
