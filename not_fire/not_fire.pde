float scl = 0.02, 
      sclTime = 0.01;
PImage buf1, buf2, coolingMap;

void setup() {
  size(600, 400);
  buf1 = createImage(width, height, HSB);
  buf2 = createImage(width, height, HSB);
  coolingMap = createImage(width, height, HSB);
  init(buf1);
  init(buf2);
  init(coolingMap);
}

void draw() {
  buf1.loadPixels();
  buf1.pixels[mouseX + mouseY*width] = color(255);
  buf1.updatePixels();
  spread(buf1);
  remap();
  
  image(buf1,0,0);
}

void remap() {
  coolingMap.loadPixels();
  for (int i = 0; i < width; i++)
    for (int j = 0; j < height; j++)
      coolingMap.pixels[i + j*width] = color(255 * noise(i*scl, j*scl, frameCount*sclTime));
  coolingMap.updatePixels();
}
void mouseDragged() {
  spread(buf1);
}

void spread(PImage x) {
  x.loadPixels();
  for (int i = 1; i < x.width - 1; i++)
    for (int j = 1; j < x.height - 1; j++)
       x.pixels[i + j*x.width] = color((
         x.pixels[(i-1) + j*x.width] +
         x.pixels[(i+1) + j*x.width] +
         x.pixels[i + (j+1)*x.width] +
         x.pixels[i + (j-1)*x.width]) >> 2 );
}
void init(PImage x) {
  x.loadPixels();
  for(int i = 0; i < x.width*x.height; i++)
    x.pixels[i] = color(0);
  x.updatePixels();
}
