  IntList r    = new IntList(); //radius
  IntList life = new IntList(); //life
  IntList maxlife = new IntList(); //max life
  IntList x    = new IntList();  //x coord
  IntList y    = new IntList();  //y coord
  IntList col  = new IntList(); //hue
  int n = (int)random(7,100);
void setup(){
  fullScreen();//size(900,800);
  frameRate(30);
  colorMode(HSB);
}
void draw(){
    fill(0,51);noStroke();rect(0,0,width,height);noFill();
  if (frameCount%(n) == 0){
    newObj((int)random(width),(int)random(height));
    n = (int)random(70,300);
  }
  //background(200);
  //fill(0);text(x.size(),20,20);//frameCount
    noFill(); stroke(#4FABF5); strokeWeight(3);
    for (int i = 0; i < x.size(); i++){
      int alpha = round(map(life.get(i), 0, maxlife.get(i), 0, 255));
      
      stroke(col.get(i),67,95,alpha);
      if (life.get(i) > 0)
        ellipse(x.get(i),y.get(i),2*r.get(i),2*r.get(i));
      if (r.get(i)-30 >= 0 && life.get(i)  > -90)
        ellipse(x.get(i),y.get(i),(1.5*r.get(i))-30,(1.5*r.get(i))-30);
      if (r.get(i)-60 >= 0 && life.get(i)  > -140)
        ellipse(x.get(i),y.get(i),(r.get(i))-60,(r.get(i))-60);
      if (r.get(i)-97 >= 0 && life.get(i) > -210)
        ellipse(x.get(i),y.get(i),(0.5*r.get(i))-90,(0.5*r.get(i))-90);
      if (life.get(i) >= -210)
        r.add(i,2); life.sub(i,1);
    }
}
void mouseClicked(){
  newObj(mouseX,mouseY);
}
void newObj(int x1,int y1)
{
  x.append(x1);
  y.append(y1);
  r.append(0);
  col.append((int)random(90,190));
  life.append((int)random(80,150));
  maxlife.append(life.get(life.size()-1));
}