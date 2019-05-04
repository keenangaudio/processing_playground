
//
//
//    this is kinda broken on exit
//
//



ArrayList<Particle> p = new ArrayList<Particle>();
PVector[][] grid;
int resolution, gridStepX, gridStepY, alpha = 5;
float windyness;
float zoff = 0, 
      zinc = 0.00025;  //time progression (kinda)
boolean line = false, bg = false, hue = false;

void setup()
{
  //size(800,600,P2D);
  fullScreen(P2D);
  background(0);
  frameRate(80);
  noiseSeed(int(random(15000)));
  initFFT();
  resolution = 20;  //make bigger for higher res
  windyness = 20;
  gridStepX = width/resolution;
  gridStepY = height/resolution;
  
  grid = new PVector[resolution+1][resolution+1];
  
  while (p.size() > 0)
    p.remove(p.size()-1);
    
  for(int i = 0; i < 8000; i++)
    p.add ( new Particle() );
  noCursor();
}
void stop() {
 playing.stop();
 exit();
}
void draw()
{
  //background(0); 
  //println(frameRate);
  //if (frameCount<250)alpha--;
  //framerate();
  sample();
  field();
  if (line) lines();   
  if (bg) bg();
  if (mousePressed)
    for(int i = 0; i < 60; i++)
      p.add( new Particle( new PVector(mouseX+random(-5,5),mouseY+random(-5,5)))  );
  for(Particle p_ : p){
    p_.walls();
    p_.move();
    p_.update();
    p_.display();
  }
 
  for(Particle p_ : p)
    p_.display();
  stroke(#F51BE7);
  point(mouseX,mouseY);
}
void bg()
{
    fill(0,1);
    noStroke();
    if (frameCount%2==0)
      rect(0,0,width,height);
      
    fill(0,7);
    if (frameCount%16==0)
      rect(0,0,width,height);
}
void mouseReleased()
{
  println(p.size());
}
void keyPressed()
{
  if (keyCode == ESC) {
    stop();
  }
  if (keyCode == 'L') {
    line = !line;
    background(0);
  } else
  if (keyCode == 'B') {
    bg = !bg;
    if (bg) 
    ;
      //alpha = 100;
    else 
      alpha = 5;
      
    background(0);
  }
  if (keyCode ==  32 ){
    hue = !hue;
    background(0);
  }
  if (keyCode == ENTER) setup();
}
void framerate()
{
  fill(0);
  noStroke();
  rect(20,20,textWidth(str(frameRate)),14);
  fill(255);
  text(frameRate,21,32);
}
void field()
{
  float inc = 0.1;
  for(int i = 0; i <= resolution; i++){
    for(int j = 0; j <= resolution; j++){ 
      grid[i][j] = PVector.fromAngle(map(noise((i)*inc,(j)*inc,zoff),0.3,0.6,0,TWO_PI)).mult(windyness);
    }
  }
  zoff+=zinc;
}
void lines()
{
  background(0);
  stroke(255); noFill(); strokeWeight(0.75);
  for(int i = 0; i <= resolution; i++)
    for(int j = 0; j <= resolution; j++){
      int _x = i*gridStepX,
          _y = j*gridStepY;
      line(_x,_y,_x+grid[i][j].x,_y+grid[i][j].y);
    }
}



  //for(int i = 0; i <= scl; i++){
  //  for(int j = 0; j <= scl; j++){ 
  //    grid[i][j] = new PVector(0,0);//PVector.fromAngle(map(noise(i*0.01,j*0.01,zoff),0,1,0,TWO_PI));
  //  }
  //}

 //if(frameCount%3==0){
  //loadPixels();
  //for (int x = 0;x<width;x++) {
  //  for (int y = 0;y<height;y++) {
  //    int index = x + y * width;
  //    float sum = 0;
  //    for (Particle b: p) {
  //      float d = dist(b.loc.x,b.loc.y,x,y)/b.w;
  //      sum += d;
  //    }
  //    sum = 25000000/sum;
  //    colorMode(HSB);
  //    pixels[index] = color(constrain(sum,40,235),255,255,10);//sum%255
  //  }
  //}
  //updatePixels();
  //}
