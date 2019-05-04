import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class oscillitory_motion_curve_shapes extends PApplet {

int x , y , d , h, w, c;
public void setup(){
  //size(800,600);
  
  noCursor();
  x = width/2;
  y = height/2;
  h = height/3;
  d = width/9;//60;
  w = d;
  frameRate(35);
  noFill();
  stroke(231,124,149);
  stroke(124,231,127);
  strokeWeight(5);
}
public void draw(){
  //frameRate(35);
  background(0);
  c++;
  c = (c<360)? c : 0;
  beginShape();
      curveVertex(0,y);
      curveVertex(x-5*d,y+(h/16)*sin(radians(c)));
      curveVertex(x-4*d,y-(h/9)*sin(radians(c)));
      curveVertex(x-3*d,y+(h/5)*sin(radians(c)));
      curveVertex(x-2*d,y-(h/3)*sin(radians(c)));
      curveVertex(x-d,y+(h/2)*sin(radians(c)));
      curveVertex(x,y-h*sin(radians(c)));
      curveVertex(x+d,y+(h/2)*sin(radians(c)));
      curveVertex(x+2*d,y-(h/3)*sin(radians(c)));
      curveVertex(x+3*d,y+(h/5)*sin(radians(c)));
      curveVertex(x+4*d,y-(h/9)*sin(radians(c)));
      curveVertex(x+5*d,y+(h/16)*sin(radians(c)));
      curveVertex(width,y);
  endShape();
}
/*for(int a = -d; a<(width/3*d);a++)
      curveVertex((a++)*d,y-h*sin(radians(c)));
      curveVertex((a)*d,y+h*sin(radians(c)));*/
  public void settings() {  fullScreen(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--stop-color=#cccccc", "oscillitory_motion_curve_shapes" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
