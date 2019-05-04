int num = 3,     //must be odd
   step = 3;
int orient = 0;
int maxNum = 29; //must be odd
PVector list[] = new PVector[maxNum+1]; 
boolean auto = false;
void setup()
{
  size(600,800);
  background(0);
  orient = (width<height)?width:height;
  for(int i = 0; i < list.length; i++)
  {
     list[i] = new PVector(0,0); 
  }
  stroke(255);
  colorMode(HSB);
  strokeWeight(2);
  noFill();
  
}

void draw()
{
  background(0);
  stroke(255);
  
  if (auto)
    autoStep();
  else
    mouseSet();
    
  text("num:  " + num,10,10);
  text("step: " + step,10,20);
  
  translate(width/2,height/2);
  
  for (int i = 0; i < num; i++)
  {
    float x = cos(i*TWO_PI/num)*0.75*orient/2;
    float y = sin(i*TWO_PI/num)*0.75*orient/2;
    list[i].x = x;
    list[i].y = y;
  }

  beginShape();
  for (int i = 0; i < num; i++)
  {
    int index = (i * step) % num;
    vertex(list[index].x, list[index].y);
  }
  endShape(CLOSE);
  
  stroke(46,250,250);
  for (int i = 0; i < num; i++)
  {
    point(list[i].x, list[i].y);
  }
}
void mouseClicked()
{
  auto = !auto;
}
void autoStep()
{
  frameRate(3);
  step += (num == maxNum - 2)? 3 : (step < maxNum)? 0 : -maxNum ;

  do
    num+=2;
  while(num % step == 0);
  
  num   = (num <  maxNum)? num : 3 ;
  
}

void mouseSet()
{
  frameRate(30);
  int numMap = 1 + 2*floor( map(mouseX,0,width,2, maxNum / 2 ) ),
     stepMap = round( map(mouseY,0,height,1,num) );
  num = numMap;
  step = stepMap;
};