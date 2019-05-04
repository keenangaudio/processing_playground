snow[] instance = new snow[0];
int n = 18;boolean Blood = false;
void setup()
{
  //size(500,500);
  fullScreen(P3D);
  background(Blood? 0 : #83DAE8);
  if (Blood) noStroke(); else stroke(#BFDDF0);
  frameRate(60);
}
void draw()
{
 if(frameCount%2==0)redraw();
  if (!Blood) background(#83DAE8);
  text("Frame: " + frameCount + "\nFramerate: " + frameRate + "\nInstances: " + instance.length,30,30);
  //leftEnter();
  //bottomEnter();
  fill(Blood? #760000:255);
  snowfall(int(random(n)));
}
void leftEnter()
{
  rotate(3*HALF_PI);
  translate(-width,0);
}
void bottomEnter()
{
  rotate(PI);
  translate(-width,-height);
}

void snowfall(int x) //snowfall(position)
{
  if (frameCount%5 == 0)
    {
      instance = expand(instance);
      instance[instance.length-1] = new snow();
      instance[instance.length-1].create(x);
    }
    for (int i=0; i<instance.length;i++)
    {
      if (instance[i].location().y >height+20 || instance[i].location().x > width+20 || instance[i].location().x < -20)
        instance = contract(instance,i);
    }
    for (int i = 0; i < instance.length;i++)
        instance[i].update();
}

snow[] expand(snow[] x)
{
  snow[] y = new snow[x.length + 1];
  for (int i = 0; i<x.length;i++)
  {
    y[i] = x[i];
  }
  return y;
}

snow[] contract(snow[] x , int index) //shortens the inputed snow array, by deleting the index at index
{
  snow[] y = new snow[x.length - 1];
  for (int i = 0; i<index;i++)//
  {
    y[i] = x[i];
  }
  for (int i = index; i<y.length;i++)//y.length
  {
    y[i] = x[i+1];
  }
  return y;
}