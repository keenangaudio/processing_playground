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

public class oscillatory_motion_peaks extends PApplet {

int d , h, n, w, a = 0,a2,r;
float h2,t,x,y; boolean up = true;
public void setup(){
  //size(800,600);
  
  noCursor();
  //x = width/2;
  y = height/2;
  h = height/15;
  d = width/7;//60;
  n = 0; w = d; t = 0; r = 0;
  h2 = 0;
  noFill();
  stroke(255,175,175);
  strokeWeight(2);
  background(0);
  
}
public void draw(){
  frameRate(60);
  fill(0,25);  noStroke();
  rect(0,0,width,height);
  //background(0,5);
  colorMode(HSB);  n = (n<1024)? ++n : 0; stroke(n/4,100,200);// fill(map(n,0,1024,0,255),100,200);//{stroke(n++,100,200);} else {n=1;} colorMode(RGB); 
  strokeWeight(2 + 0.5f*(sin((radians(a/2))))); noFill(); //stroke(255,175,175); 
  a++; t += 2*sin(2*cos(radians(r/2)));
  //text(t,30,30);
  r = (r<=720)? r : 0; r++;
  a = (a<=360)? a : 0;
  h2 = 45+10*sin((radians(r/2)));
  //text((up)? "true" : "false",30,60); text("        " + h2,30,60);
  beginShape();
  vertex(0-2*d,y);
    for (int x = -2*(d) ;x < width+2*d; x+=2*d)
    {
      //h2 = (up == true)? ++h:--h ;
      a2 = abs((x-width/3)); map(a2,0,width/2,1,d);
      //text(a2 + "  " + h2,x,y-90);
      //text(x ,x,y-70);
      //text(h + "  " + (y +((h*(h2/a2)*sin(radians(a))))),x,y-50);  
      curveVertex(x+t ,y +((h*(h2/a2)*sin(radians(a)))));
      curveVertex((x)+d+t,y -((h*(h2/a2)*cos(radians(a)))));
    }
    vertex(width +2*d,y);
  endShape();
}

/*
  for(int x = 0 ;x<width/2+d;x+=2*d){
    h2++;
    curve(x-w*abs(sin(radians(a))),y+(h/h2)*cos(radians(a)),x,y,x+d,y,x+d+w*abs(sin(radians(a))),y+(h/h2)*cos(radians(a)));
    curve(x+d-w*abs(sin(radians(a))),y-(h/h2)*cos(radians(a)),x+d,y,x+2*d,y,x+(2*d)+w*abs(sin(radians(a))),y-(h/h2)*cos(radians(a)));
  }
  h2 = 0;
  stroke(124,231,189);
  for(int x = 0;x>(-width)/2-d;x-=2*d){
    h2++;
    curve(x-w*abs(sin(radians(a))),y+(h/h2)*cos(radians(a)),x-d,y,x-2*d,y,x-2*d-w*abs(sin(radians(a))),y+(h/h2)*cos(radians(a)));

    curve(x+d-w*abs(sin(radians(a))),y-(h/h2)*cos(radians(a)),x,y,x-d,y,x-(d)-w*abs(sin(radians(a))),y-(h/h2)-h*cos(radians(a)));
  }
    beginShape();
      for (int x = -2*(d) ;x < width+2*d; x+=2*d)
    {
      h2 = (up == true)? ++h:--h ;
      a2 = abs((x-width/3)); map(a2,0,width/2,1,d);
      
      curveVertex(x+t ,y -2*((h*(h2/a2)*sin(radians(a)))));
      curveVertex((x)+d+t,y +2*((h*(h2/a2)*cos(radians(a)))));
    }
   endShape();
}*/
  public void settings() {  fullScreen(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "oscillatory_motion_peaks" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
