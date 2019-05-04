  int count = 0; //counts clicks
  int x1;  int y1;
  int x2;  int y2;
  IntList old_x1 = new IntList();  //number of rectangles permitted
  IntList old_y1 = new IntList();
  IntList old_x2 = new IntList();
  IntList old_y2 = new IntList();
  int rectcount = 0;  //counts drawn rectangles
void setup(){
  size(500,500);
  
}
void draw() {
    background(18, 8, 167);
    noFill();
    text( "rectangles drawn: " + old_x1.size(),15,20);
  if (rectcount >= 0){
    for (int i = 0; i < old_x1.size(); i++){
      rect(old_x1.get(i), old_y1.get(i), old_x2.get(i) - old_x1.get(i), old_y2.get(i) - old_y1.get(i));
    }
  }
  if (x1 != 0 && y1 != 0 && count%2 == 1){ //odd numbered clicks
    x2 = mouseX;  y2 = mouseY;
    stroke(167, 8, 8);
    strokeWeight(7);
    rect(x1, y1, x2 - x1, y2 - y1);
  } else if (x1 != 0 && y1 != 0 && count%2 == 0){ //even numbered clicks
    stroke(167, 8, 8);
    strokeWeight(7);
    rect(x1, y1, x2 - x1, y2 - y1);
  }
}
void mousePressed(){
  if (mouseButton == LEFT){
    count++;
    if (count%2 == 1){
      x1 = mouseX;  y1 = mouseY;
    } else if (count%2 == 0){
      x2 = mouseX;  y2 = mouseY;
      old_x1.append(x1);
      old_y1.append(y1);
      old_x2.append(x2);
      old_y2.append(y2);
    }
  }
}