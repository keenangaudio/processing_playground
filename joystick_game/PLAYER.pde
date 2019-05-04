class player
{
  int life , clip ;
  proj[] bullets = new proj[0];
  float r = 30;
  PVector loc , speed;
  PVector zero = new PVector(0,0);
  void create()
  {
    loc = new PVector(random(width/3,width*2/3),random(height/3,height*2/3));
    speed = zero;
  }
  void update()
  {
     //user.speed.x = 5*gpad.getSlider("LX").getValue();
     //user.speed.y = 5*gpad.getSlider("LY").getValue();
    if (keyPressed && !(loc.x+speed.x > width || loc.x+speed.x < 0 ||loc.y+speed.y > height || loc.y+speed.y < 0))
      loc.add(speed);
    display();
    
  }
  void display()
  {
    ellipse(loc.x,loc.y,r,r);
  }
  void shoot()
  {
    println("shoot");
    float speed = 10,
          angle = atan2(mouseX-loc.x,mouseY-loc.y);
    bullets = extend(bullets,angle,loc,speed);
    println(bullets.length);
  }
  void hit()
  {
    //something goes here to prevent extra hits
    life--;
  }
  void speedfunc()
  {
    if (key =='a')//&& pKey == 0) //A
      speed.x -= speed.x>-5? 1:0;
    if (key =='d')//&& pKey == 0) //D
      speed.x += speed.x< 5? 1:0;
       
    if (key =='w')//&& pKey == 0) //W
      speed.y -= speed.y>-5? 1:0;
    if (key =='s')//&& pKey == 0) //S
      speed.y += speed.y< 5? 1:0;
  }
  proj[] extend(proj[] a , float rads , PVector n ,float s)
  {
    println("extend");
    proj[] y = new proj[a.length + 1];
    for(int i = 0; i <a.length ; i++)
      y[i] = a[i];
    y[a.length] = new proj(rads,n,s);
    a = new proj[y.length];
    for(int i = 0; i<y.length;i++)
      a[i] = y[i];
    println(a.length);
    return a;
  }
}
 class proj
{
  proj(float a,PVector n ,float s)
  {
    angle = a;
    loc   = new PVector(n.x,n.y);
    speed = new PVector(sin(a),cos(a));
    speed.mult(s);
  }
  float angle = 0, rad = 2;
  PVector loc , speed;
  void update()
  {
    loc.add(speed);
    fill(#C7E865);
    ellipse(loc.x,loc.y,2*rad,2*rad);
  }

}