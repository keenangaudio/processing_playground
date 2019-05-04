class Mass {
  int r = 40, l = 60;
  PVector loc;
  Mass(int x, int y) {
    loc = new PVector(x,y);
    loc.setMag(l);
  }
  void update() {
    loc.rotate(0.1);
  }
  void show() {
    ellipse(loc.x,loc.y,r,r);
  }
  
}

Mass m1, m2;


void setup() {
  size(600,600);
  background(0);
  stroke(255);
  strokeWeight(3);
  m1 = new Mass(1,1);
  m2 = new Mass(0,0);
  
}
void draw() {
  translate(300,300);
  m1.update();
  m1.show();
  
}