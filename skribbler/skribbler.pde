ArrayList<PVector> arr;
int c = 0;

void setup() {
  arr = new ArrayList<PVector>();
  arr.add( new PVector (0, 0) );
  background(31);

  colorMode(HSB);
  //blendMode(LIGHTEST);
  //stroke(0, 200,200);
  stroke (250);
  strokeWeight(1);
  //size(400,400);
  fullScreen(P3D);
  noFill();
  frameRate(1000);
}
void draw() {
  if (frameCount % 15 == 0){
    fill(0, 4);
    noStroke();
    rect(0, 0, width-1, height-1);
    noFill();
  }
  translate(width/2, height/2);
  for (int i = 0; i < 1; i++) {
    PVector p = arr.get(arr.size()-1);
    PVector q = gen(arr.get(arr.size()-1));
    arr.add(q);
    c++;
    stroke(c %= 255, 200, 200);
    line(p.x, p.y, q.x, q.y);
  }
}

public PVector gen (PVector in) {
  PVector p;
  do {
    float angle = random(0, TWO_PI);
    float radius = random(7, 10);
    p = PVector.fromAngle(angle);
    p = p.mult(radius);
    p = p.add(in);
  } while ( abs(p.x) > width/2 || abs(p.y) > height/2 );
  return p;
}