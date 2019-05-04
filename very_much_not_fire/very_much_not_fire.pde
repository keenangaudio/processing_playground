float scl = 0.02, 
      sclTime = 0.01;
PGraphics buf1, buf2;
PImage coolingMap;

void setup() {
  frameRate(2500);
  //size(1200, 400);
  fullScreen();
  buf1 = createGraphics(width, height);
  buf2 = createGraphics(width, height);
  coolingMap = createImage(width, height,HSB);
  init(buf1);
  init(buf2);
  init(coolingMap);
  
  buf1.noStroke();
  buf1.fill(255);
}

void draw() {
  //load();
  if (mousePressed) 
    spread(buf1);
  
  remap();
  cool(buf1);
  //update();
  image(buf1,0,0);
 // image(coolingMap,width/2,0);
}

void remap() {
  coolingMap.loadPixels();
  for (int i = 0; i < coolingMap.width; i++)
    for (int j = 0; j < coolingMap.height; j++)
      coolingMap.pixels[i + j*coolingMap.width] = 
          color(255 * noise(i*scl, j*scl+frameCount*sclTime));
  coolingMap.updatePixels();
}
void cool(PGraphics x) {
  x.beginDraw();
  x.loadPixels();
  for(int i = 0; i < x.width*x.height; i++)
    if ( x.pixels[i] >= coolingMap.pixels[i] )
      x.pixels[i] -= color( brightness( coolingMap.pixels[i] ) * 0.25 ) ;
  x.updatePixels();
  x.endDraw();
}

void keyPressed() {
  buf1.beginDraw();
  buf1.ellipse(mouseX,mouseY,5000,5000);
  buf1.endDraw();
}

void spread(PGraphics x) {
  x.beginDraw();
  x.loadPixels();
  for (int i = 1; i < x.width - 1; i++)
    for (int j = 1; j < x.height - 1; j++)
       x.pixels[i + j*x.width] = color((
         brightness(x.pixels[(i-1) + j*x.width]) +
         brightness(x.pixels[(i+1) + j*x.width]) +
         brightness(x.pixels[i + (j+1)*x.width]) +
         brightness(x.pixels[i + (j-1)*x.width]) ) / 4 );
  x.updatePixels();
  x.endDraw();
}
void init(PGraphics x) {
  x.beginDraw();
  x.background(0);
  x.endDraw();
  //x.loadPixels();
  //for(int i = 0; i < x.width*x.height; i++)
  //  x.pixels[i] = color(0);
  //x.updatePixels();
}

void init(PImage x) {
  x.loadPixels();
  for(int i = 0; i < x.width*x.height; i++)
    x.pixels[i] = color(0);
  x.updatePixels();
}
void load() {
  buf1.beginDraw();
  buf2.beginDraw();
  
  buf1.loadPixels();
  buf2.loadPixels();
  coolingMap.loadPixels();
}
void update() {
  buf1.endDraw();
  buf2.endDraw();
  
  buf1.updatePixels();
  buf2.updatePixels();
  coolingMap.updatePixels();
}
