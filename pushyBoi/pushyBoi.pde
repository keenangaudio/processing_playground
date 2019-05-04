float 
  damping = 1.2,
  scale = 20,
  res = 30;
  
void setup () {
  background (0);
  stroke (200,76,167);
  strokeWeight (2);
  noFill ();
  size (600,400);
}

void draw () {
  background (0);
  translate (0,height/2);
  scale = (mouseY-height/2) + 1;
  scale /= 5;
  scale = (scale<=1)? 1: scale;

  beginShape ();
  for (int x = 0; x < width; x++) {
    float index = abs (x - width/2) + 5;
    index /= scale;
    float y = pow (index, damping); 
    y = (scale) / y;
    float xp = (x - width/2 ) * scale + width/2;
    curveVertex (xp, y);
  }
  endShape ();
  
}
