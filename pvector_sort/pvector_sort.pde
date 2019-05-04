import java.util.Arrays;
import java.util.*;
void setup()
{
  float a,b;
  PVector[] rad = new PVector[120];
  for (int i = 0; i<120;i++)
  {
    a = random(-1,1);
    b = random(-1,1);
    println(i + " (" + a + "," + b + ") " + atan2(b,a));
    rad[i] = new PVector(a,b,atan2(b,a));
  }
  Arrays.sort(rad,new CompareToCenter());
  for (int i = 0; i<120;i++)
    println(i + " " + rad[i]);
  exit(); 
}
class CompareToCenter implements Comparator<PVector>
{
  //@Override
  int compare(PVector v1, PVector v2)
  {
    return int((v1.z - v2.z)/abs((v1.z - v2.z)));
  }
}