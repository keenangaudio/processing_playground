class Mesh {
  float model1[][], 
    model2[][];
  int w, h;
  boolean wrap = true;

  Mesh (int w, int h) {
    this.w = w;
    this.h = h;
    model1 = new float[ w ][ h ];
    model2 = new float[ w ][ h ];
  }
  Mesh() {
    this(width, height);
  }

  void swap() {
    float tmp[][] = model1;
    model1 = model2;
    model2 = tmp;
  }
  void update() {
    for (int i = 1; i < w - 1; i++)
      for (int j = 1; j < h - 1; j++)
        sum (i, j);
    swap();
  }
  void sum (int x, int y) {
    float old = model2[x][y];
    model2[x][y] = (model1[x-1][y] + model1[x][y-1] 
                  + model1[x+1][y] + model1[x][y+1]) / 2 - model2[x][y];
    model2[x][y] *= damping;

    //if ( wrap ) wrap();
    //else noWrap();
  }
  void setValue (int x, int y) {
    try {
      model1[x][y] = 255;
    } catch (IndexOutOfBoundsException e) {}
  }
  float[][] getModel() {
    boolean safe = false;

    float tmp[][] = new float[w][h];
    for (int i = 0; i < w; i++)
      for (int j = 0; j < h; j++)
        tmp[i][j] = model2[i][j];

    if (safe) return tmp;
    else return model1;
  }

  void wrap() {
  }
  void noWrap() {
  }
}
