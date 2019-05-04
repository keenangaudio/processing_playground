import java.awt.event.KeyListener;
import java.util.Arrays;
int pKey =1 ,keysHeld = 0; boolean keyP = false, noKey = true;
boolean[] keyIndex = new boolean[128];
player user = new player();
void setup()
{
  size(500,500);
  user.create();
  Arrays.fill(keyIndex,false);
}
void draw()
{
  background(200);
  if (keysHeld==0)
    noKey = true;
  //user.speed();
  user.update();
  println(keysHeld);
  for (proj b: user.bullets)
     b.update();
}
void mousePressed()
{
  user.shoot();
}
void keyPressed()
{
  if (key == 32) user.shoot();
  keysHeld+=(key == 32)? 0:1;
  keyIndex[int(key)] = true;
  println(char(key) + "  " + keyIndex[int(key)]);
  keyP = true;
  noKey = false;
  println("noKey  " + noKey);
  
}
void keyReleased()
{
  keysHeld-=(keysHeld>0)?1:0;
  keyIndex[int(key)] = false;
  println(char(key) + "  " + keyIndex[int(key)]);
  int sum=0;
  for (boolean k : keyIndex)
    sum += k? 1:0;
  
  println("noKey  " + noKey);
  if (user.speed.equals(user.zero)){
      Arrays.fill(keyIndex,false);
      println("false fill");
  }
}