import processing.sound.*;

import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;

int res = 35;
float r = 100, zoff = 0, a = 0,ang = 0;
PVector[][] p = new PVector[res+1][res+1];
PVector[][] v = new PVector[res+1][res+1];
PVector Z = new PVector(0,0,1);
boolean space = false , sound = true, bg = false;
Particle[] parts = new Particle[400];
PeasyCam cam;
AudioIn playing;
FFT ana; int bands = 256,t=-90;
float[] spec = new float[bands];

float xRot, yRot, zRot;

void setup()
{
  //size(600, 600, P3D);
  fullScreen(P3D);
  int seed = round(random(15000));
  println("Seed: " + seed);
  noiseSeed(4895);
  sphereDetail(8);
 
  playing = new AudioIn(this, 1);
  ana = new FFT(this,bands);
  playing.start();
  ana.input(playing);
  
  noCursor();
  //cam = new PeasyCam(this, 300);
   a=0;
   ang = 0;
   
  noFill();
  noStroke();
  
  for (int i = 0; i < res+1; i++) {
    float lon = TWO_PI*i/res;
      for  (int j = 0; j < res+1; j++) {
    float lat = PI*j/res, 
      x = r*sin(lat)*cos(lon), 
      y = r*sin(lat)*sin(lon), 
      z = r*cos(lat);
      p[j][i]   = new PVector(x, y, z);
      float r2  = map(noise(p[j][i].x/r+zoff,p[j][i].y/r+zoff,p[j][i].z/r+zoff),0,1,0.8,1.2);
      p[j][i].mult(r2);
    }
  }
  for (int i = 0; i < parts.length; i++)
    parts[i] = new Particle(p[int(random(p.length))][int(random(p.length))],i);
  
  background(0);
}
void draw()
{
  // move arount the view all fancy like
  screen();
  
  ana.analyze(spec);
  mouseCheck();
  //lights();
  //if (mousePressed)
  if (bg)
    background(0);
  //if (s){
  //  fill(0);
  //  noStroke();
  //  sphere(r-1);
  //}
  //rotateX(HALF_PI);
  //rotateZ(ang-=0.01);
  //bg();

  strokeWeight(0.5);
  //println(frameRate);
  a+=0.1;
  calcVectors();
  if (space)drawVectors();
  //stroke(#4AE54B,20);
  stroke(240,20);
  colorMode(HSB);
  strokeWeight(2*noise(a));
  for(Particle p_ : parts){
    p_.move();
    //stroke((i++)%255,250,250,50);//map(i++,0,1999,0,255)
    noStroke();
    fill((p_.num)%255,100,200);
    p_.update();
   // p_.display();
    for(Particle b : parts)
      p_.collide(b);
  }
 // noLoop();
}
void keyPressed()
{
 if (keyCode == 32) space = !space;
 if (keyCode == ENTER) setup();
 if (keyCode == TAB) noLoop();
 if (keyCode == SHIFT) loop();
 if (keyCode == 'S') sound = !sound;
 if (keyCode == 'B') bg = !bg;
}
void mouseCheck()
{
  float b = 50;
  if (mouseX+b>width || mouseX-b<0 || mouseY+b>height || mouseY-b<0) {
    cursor(); 
    println("edge");
  }  else  {
    noCursor();
  }
}
void calcVectors()
{
  for    (int i = 0; i< res+1; i++) {
    float   lon = TWO_PI*i/res;//map (i, 0, res, 0, TWO_PI);
    for  (int j = 0; j< res+1; j++) {
      float lat = map(j, 0, res, 0, PI), 
              x = r*sin(lon)*cos(lat), 
              y = r*sin(lon)*sin(lat), 
              z = r*cos(lon);
      p[i][j]   = new PVector(x, y, z);
      //float r2  = map(noise(p[i][j].x/r+zoff,p[i][j].y/r+zoff,p[i][j].z/r+zoff),0,1,0.8,1.2);
      //p[i][j].mult(r2);
    }
  }

  for    (int i = 0; i <= res; i++) {
    for  (int j = 0; j < res; j++) {
      float r2  = noise(p[i][j].x/r+zoff,p[i][j].y/r+zoff,p[i][j].z/r+zoff);
      PVector t1 = PVector.fromAngle(map(r2,0.25,0.75,0,TWO_PI));
      v[i][j] = p[i][j].copy().normalize().cross(t1).mult(10);
    }
  }
  zoff+=0.0035;
}
void drawVectors()
{
  for (int i = 0; i<res; i++) {
    //
    beginShape(TRIANGLE_STRIP);
    //fill(i%2==0?150:250);
    for (int j = 0; j<res; j++) {
      stroke(i*8,(j<res/2)?j*8:240-j*8,240-(i+j)/4);
      fill  (i*8,(j<res/2)?j*8:240-j*8,240-(i+j)/4);
      vertex(p[i][j].x, p[i][j].y, p[i][j].z);
      vertex(p[i][j+1].x, p[i][j+1].y, p[i][j+1].z);
    }
    //if (i==res-1) {
    //  vertex(p[0][j].x, p[0][j].y, p[0][j].z);
    //  vertex(p[0][j+1].x, p[0][j+1].y, p[0][j+1].z);
    //}
    endShape(CLOSE);
    //
    for (int j = 0; j<res; j++) {
      stroke(i*8,(j<res/2)?j*8:240-j*8,240-(i+j)/4);
      line (p[i][j].x, p[i][j].y, p[i][j].z, p[i][j].x+v[i][j].x, p[i][j].y+v[i][j].y, p[i][j].z+v[i][j].z);
    }
  }
  
  noFill();
}

void screen() {
  translate(width/2,height/2,850);
  xRot+=(noise(t+=0.01))/10.0;
  yRot+=(noise(t*t))/10.0;
  zRot=(noise(t*t*t))/10.0;
  
  rotateX(xRot);
  rotateY(yRot);
  rotateZ(zRot);
}

// for    (int i = 0; i< res+1; i++) {
//    float   lat = TWO_PI*i/res;//map (i, 0, res, 0, TWO_PI);
//    for  (int j = 0; j< res+1; j++) {
//      float lon = map(j, 0, res, 0, PI), 
//              x = r*sin(lon)*cos(lat), 
//              y = r*sin(lon)*sin(lat), 
//              z = r*cos(lon);
//      p[j][i]   = new PVector(x, y, z);
//      float r2  = map(noise(p[j][i].x/r+zoff,p[j][i].y/r+zoff,p[j][i].z/r+zoff),0,1,0.9,1.1);
//      PVector t = PVector.fromAngle(map(r2,0.9,1.1,0,TWO_PI));
//      p[j][i].mult(r2);
//      v[j][i] = t.copy().mult(10);
//    }
//  }

    //beginShape(TRIANGLE_STRIP);
    //fill(i%2==0?150:250);
    //for (int j = 0; j<res; j++) {
    //  stroke(i*8,(j<res/2)?j*8:240-j*8,240-(i+j)/4);
    //  //fill  (i*8,(j<res/2)?j*8:240-j*8,240-(i+j)/4);
    //  vertex(p[i][j].x, p[i][j].y, p[i][j].z);
    //  vertex(p[i+1][j].x, p[i+1][j].y, p[i+1][j].z);
    //}
    //endShape(CLOSE);
//void bg()
//{
//  pushMatrix();
//  float[] camRot = cam.getRotations();
//  float[] camPos = cam.getPosition();
//  rotateX(camRot[0]);
//  rotateY(camRot[1]);
//  rotateZ(camRot[2]);
//  translate(camPos[0],camPos[1],camPos[2]);
//  fill(0,5);noStroke();
//  rect(0,0,width,height);
//  popMatrix();
//}
