double inc;
int dX, dY;
void setup()
{
  size(800,400,P3D);
  //fullScreen(P3D);
  //scale(0.5);
  colorMode(HSB);
  dX = width/2;
  dY = height/2;
  inc = 0.01;
}
void draw()
{
  if (mousePressed) {
    dX += (0.01/inc)*(mouseX-pmouseX);
    dY += (0.01/inc)*(mouseY-pmouseY);
  }
  //translate(dX,dY);
  loadPixels();
  for(int i = 0; i < width; i++) {
    for(int j = 0; j < height; j++) {
      int index = i + j*width;
       int k = mandelbrot((i - dX)*inc,(j - dY)*inc);
       int b = int(map(dist(i,j,width/2,height/2)-k,0,512-255,0,255));
      pixels[index] = color((k)%255,255-k,k);//+(i+j)/2
      //pixels[index+width] = color((k),255,255-k);
      //pixels[index+1] = color((k),255,255-k);
      //pixels[index+width+1] = color((k),255,255-k);
    }
  }
  
  updatePixels();
  //translate(dX,dY);
  //text(dX + " , " + dY + "\nZ: " + inc + "\nFR: " + frameRate,20,20);
  //stroke(255);fill(0);
  //rect(20,20,width/10,height/10);
  //stroke(33,255,255);fill(33,255,255);
  //ellipse(map(dX,0,width,20,width/10),map(dY,0,height,20,height/10),3,3);
}
int mandelbrot(double i_, double j_)
{
  int k = 255;
  //int i = 0;
  double a = i_;
  double b = j_;
  for (int i = 0; i< k; i++) {
    double a_ = a*a-b*b;
    b = 2*a*b;
    a = a_;
    a += i_;//(mouseX-width/2)*inc;
    b += j_;//(mouseY-width/2)*inc;
    if (Math.sqrt(a*a+b*b)>=2) {
      return i;
    }
  }
  return k;
}
void mouseWheel(MouseEvent e)
{
  inc = inc + ((inc == 0)? pow(2,-63) : inc ) * (e.getCount()/100.0);
  //println(inc,e.getCount());
}
void keyPressed()
{
  int d = 50;
  if (keyCode == LEFT) dX+=d;
  if (keyCode == RIGHT) dX-=d;
  if (keyCode == UP) dY+=d;
  if (keyCode == DOWN) dY-=d;
  if (keyCode == ' ') {dX = 0; dY = 0;}
  if (keyCode == ENTER) setup();

}
