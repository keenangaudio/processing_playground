int wid = 1400, 
  hig = 600, 
  res = 20;
float damping = 0.991;
Mesh content;
PImage texture;

void settings () {
  size ( wid, hig );
}

void setup () {
  content = new Mesh (wid, hig);
  texture = loadImage("texture1.png");
  texture.resize(wid,hig);
}

void draw () {
  //droplet();
  content.update();
  loadPixels();
  texture.loadPixels();
  float[][] tmp = content.getModel();
  for (int x = 1; x < tmp.length-1; x++)
    for (int y = 1; y < tmp[x].length-1; y++) {
      int val = int ( tmp[x][y] );
      //int val = shader(tmp, x, y);
      pixels[x + y*wid] = color ( val );
    }

  updatePixels();
}

void mousePressed() {
  content.setValue(mouseX, mouseY);
}

void droplet() {
  int x = floor ( random (wid) );
  int y = floor ( random (hig) );
  content.setValue(x, y);
}

int shader (float[][] tmp, int x, int y) {
  int
      Xoffset = parseInt (tmp[x-1][y] - tmp[x+1][y]),
      Yoffset = parseInt (tmp[x][y-1] - tmp[y][y+1]);
      int Shading = (Xoffset + Yoffset) / 2;
      int t;
      try {
        t = texture.pixels[x+Xoffset + (y+Yoffset)*wid];
      } catch (IndexOutOfBoundsException e) {
        t = 0;
      }
      return color(t + Shading);
}
