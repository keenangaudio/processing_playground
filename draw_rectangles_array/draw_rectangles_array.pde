  int count = 0; //counts clicks
  int x1;  int y1;
  int x2;  int y2;
  int[] array_x1 = new int[10];  //number of rectangles permitted
  int[] array_y1 = new int[array_x1.length];
  int[] array_x2 = new int[array_x1.length];
  int[] array_y2 = new int[array_x1.length];
  int arraycount = 0;  //counts drawn rectangles
void setup(){
  size(500,500);
}
void draw() {
    background(18, 8, 167);
    noFill();
    text( "rectangles drawn: " + arraycount,15,20);
    text("rectangles left: " + (array_x1.length - arraycount),15,35);
  if (arraycount >= 0){
    for (int i = 0; i < arraycount; i++){
      rect(array_x1[i], array_y1[i], array_x2[i] - array_x1[i], array_y2[i] - array_y1[i]);
    }
  }
  if (x1 != 0 && y1 != 0 && count%2 == 1){ //odd numbered clicks
    x2 = mouseX;  y2 = mouseY;
    stroke(167, 8, 8);
    strokeWeight(7);
    rect(x1, y1, x2- x1, y2 - y1);
  } else if (x1 != 0 && y1 != 0 && count%2 == 0){ //even numbered clicks
    stroke(167, 8, 8);
    strokeWeight(7);
    rect(x1, y1, x2 - x1, y2 - y1);
  }
}
void mousePressed(){
  if (mouseButton == LEFT){
    count++;
    if (count%2 == 1 && arraycount < array_x1.length){
      x1 = mouseX;  y1 = mouseY;
    } else if (count%2 == 0 && arraycount < array_x1.length){
      x2 = mouseX;  y2 = mouseY;
      array_x1[arraycount] = x1;
      array_y1[arraycount] = y1;
      array_x2[arraycount] = x2;
      array_y2[arraycount++] = y2;
    } else {
      arraycount = 0;
      x1 = mouseX;  y1 = mouseY;
    }
  }
}