  IntList r = new IntList(); 
  IntList x = new IntList();
  IntList y = new IntList();
void setup(){
  size(900,800);
  frameRate(40);
}
void draw(){
  //background(200);
  fill(200,25);rect(0,0,width,height);noFill();
  if (frameCount%100 == 0){
    x.append(int(random(width)));
    y.append(int(random(height)));
    r.append(0);
  }
  //text(frameCount,20,20);
    noFill();
    for (int i = 0; i < x.size(); i++){
    ellipse(x.get(i),y.get(i),2*r.get(i),2*r.get(i));
    ellipse(x.get(i),y.get(i),(1.5*r.get(i))-30,(1.5*r.get(i))-30);
    ellipse(x.get(i),y.get(i),(r.get(i))-60,(r.get(i))-60);
    ellipse(x.get(i),y.get(i),(0.5*r.get(i))-90,(0.5*r.get(i))-90);
    r.increment(i);  r.increment(i);
    }
}
void mouseClicked(){
  x.append(mouseX);
  y.append(mouseY);
  r.append(0);
}