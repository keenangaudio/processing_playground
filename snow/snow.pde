snow[] instance = new snow[0];
float[] snw_fll = {322.3,311.9,230.5,276.5,315.9,217.5,235.7,115.4,
                     110.6,105.9,121.4,126.7,48.2,43.8,145.0,151.8};
void setup()
{
  size(500,500);
  //for (int i = 0; i<5;i++)
    //instance[i] = new snow();create(int(random(0,18)));
  
}

void draw()
{
  background(200);
  for (int n=0; n<snw_fll.length ;n++){
    int x = map(n,0,325,0,10);
    if (frameCount%20 == 0)
    {
      instance = expand(instance);
      instance[instance.length-1] = new snow();
      instance[instance.length-1].create(int(random(0,18)));
    }
    for (int i=0; i<instance.length;i++)
      instance[i].update();
  }
  
}

void snowfall(int x, float amnt) //snowfall(position,amount of snowfall)
{
  
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

class snow
{
  PVector location , speed ;
  float r = random(1,4);
  void create(int x) //position
  {
  location = new PVector(random(1+x*(width/18),2+x*(width/18)),0);
  speed    = new PVector(random(-0.5,0.5),0.5);
  }
  void update()
  {
    speed.x *= random(1)>0.5? random(0.9,1.1) : random(0.9,1.1) ; //gives it a little wiggle side to side
    location.add(speed);
    ellipse(location.x,location.y,r,r);
  }
}