PVector col = new PVector(random(50,150),random(50,100),random(50,150));
void setup(){
  size(400,400);
}
void draw(){
  frameRate(6);
  PVector col = new PVector(random(47,110),random(50,110),random(70,110));
  background(col.x,col.y,col.z);
}