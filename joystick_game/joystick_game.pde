import org.gamecontrolplus.gui.*;
import org.gamecontrolplus.*;
import net.java.games.input.*;

ControlIO control;
Configuration config;
ControlDevice gpad;
player user;
void setup()
{
  size(800, 500);
  user = new player();
  control = ControlIO.getInstance(this);
  gpad = control.getMatchedDevice("XboxController");
  if (gpad == null) {
    println("No suitable device configured");
    System.exit(-1); // End the program NOW!
  }
  user.create();
}
void draw()
{
  user.speed.x = map(gpad.getSlider("LX").getValue(),-1,1,-5,5);
  user.speed.y = map(gpad.getSlider("LY").getValue(),-1,1,-5,5);
  user.update();
  for (proj b: user.bullets)
     b.update();

}
void keyPressed()
{
  if (key == 32) user.shoot();
}