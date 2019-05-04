int x , y , s , r;
PVector[] point = new PVector[55];
PVector max = new PVector(width,height);
void setup(){
  //size(500,800);
  fullScreen();
  noStroke();

}
void draw(){
    translate(width/2,height/2);
  colorMode(HSB);
  background(random(255),random(50,100),200);
  for (int i = 0; i < point.length; i++){
    int n = int(random(90,180));
     r = int(random(2));
     s = (r==1) ? -1 : 1;
    
    fill(random(255),random(100,200),200);
    point[i] = PVector.random2D();
    point[i].mult(s);
    point[i].setMag(random(150,sqrt(pow(width,2)+pow(height,2))));
    ellipse(point[i].x,point[i].y,n,n);
  }
  fill(0);
  textAlign(CENTER);
  textSize(32);
  text("SUH DOOD.",0,0);
}