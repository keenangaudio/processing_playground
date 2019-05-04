//put this in terminal before running
// defaults write -g ApplePressAndHoldEnabled -bool false

ArrayList<Asteroid> a;
ArrayList<Bullet> b;
Player p1;
int n = 400, maxRadius;
boolean[] keysDown;
float difficulty = 0.5;
void setup()
{
  //fullScreen();
  size(800,600);
  background(0);
  colorMode(HSB);
  stroke(random(255),200,200);
  noFill();
  strokeWeight(2);
  ellipseMode(CENTER);
  
  maxRadius = floor(sqrt(width*width/4+height*height/4));
  keysDown = new boolean[4];
  for(int i = 0; i < 4; i++)
    keysDown[i] = false;
 
  p1 = new Player();
  a = new ArrayList<Asteroid>();
  b = new ArrayList<Bullet>();
  //for(int i = 0; i < n; i++)
  //  a.add( new Asteroid() );
}

void draw()
{
  if (frameCount%60 == 0) a.add( new Asteroid() );
  
  background(0);
  fill(255);
  
  for(int i = 0; i < 4; i++)
    text(keysDown[i]?1:0,10,10*(1+i));
  text(a.size() + " Asteroids.",10,60);
  text(b.size() + " Bullets.",10,72);
  translate(width/2,height/2);
 
  noFill();
  
  p1.update();
  for(Asteroid zoomyBoi : a)
    zoomyBoi.update();
  for(Bullet speedyBoi : b)
    speedyBoi.update();
  for(int i = a.size() - 1; i > 0; i--)
  {
    Asteroid subject = a.get(i);
    if ( subject.checkBounds() )
      a.remove(i);
  }
  for(int i = b.size() - 1; i > 0; i--)
  {
    Bullet subject = b.get(i);
    if ( subject.checkBounds() )
      b.remove(i);
  }
}
void keyPressed()
{
  //if (key ==  32) setup();
  if (key ==  32) b.add( new Bullet(p1.p) );
  if (key == 'a') keysDown[0] = true;
  if (key == 'd') keysDown[1] = true;
  if (key == 'w') keysDown[2] = true;
  if (key == 's') keysDown[3] = true;
}
void keyReleased()
{
  if (key == 'a') keysDown[0] = false;
  if (key == 'd') keysDown[1] = false;
  if (key == 'w') keysDown[2] = false;
  if (key == 's') keysDown[3] = false;
}