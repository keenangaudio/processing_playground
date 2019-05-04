void setup(){
 size(255,255) ;
}
void draw(){
  if(mousePressed){
  fill(mouseX,mouseY);
  stroke(mouseX,mouseY);
  ellipse(mouseX,mouseY,50,50);
  }
}