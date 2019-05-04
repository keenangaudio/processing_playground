class Curve
{
  int  h, n, a = 0, a2, r, d, w;
  float h2, t, x, y, j; 
  boolean up = true;
  Curve(float i) {
    y = (2+i)*height/(c.length+3);//randomGaussian()*i;
    h = ((random(1)<0.5)?1:-1)*height/15 + round(randomGaussian()*i);
    d = width/int(random(1,1+i)) ;//+ round(randomGaussian()*i);//60;
    n = round(random(1024));//randomGaussian()*i*19)%255; 
    w = d ;//+ round(randomGaussian()*i); 
    r = 0+round(randomGaussian()*i);
    t = randomGaussian()*100*i+i*10; 
   h2 = 0;
    j = randomGaussian()*10+i;
    background(0);
    colorMode(HSB);
  }
  void frame() {
    n = (n<1024)? ++n : 0; 
    stroke(n/4, 100, 200);
    strokeWeight(2 + 0.5*(sin((radians((a+=j)/2))))); 
    noFill();
    t += tval(0);
    r = (r<=720)? r : 0; 
    ++r;
    a = (a<=360)? a : 0;
    h2 = h2val(0);
    drawShape();
    //troubleshoot();
  }
  void drawShape()
  {
    beginShape();
    vertex(0-2*d, y);
    for (int x = -2*(d); x < width+2*d; x+=2*d)
    {
      a2 = abs((x-width/3)); 
      map(a2, 0, width/2, 1, d); //bigger in the middle left
      //tshoot(x); 
      curveVertex(x+t, y +curveY(0, false));
      curveVertex((x)+d+t, y -+curveY(0, true));
    }
    vertex(width +2*d, y);
    endShape();
  }
  float curveY(int i, boolean cos)  //i is displacement
  {
    if (cos)
      return ((h*(h2val(i)/a2)*cos(radians(a-i))));
    else
      return ((h*(h2val(i)/a2)*sin(radians(a-i))));
  }
  float tval(int i)   //i is displacement
  {
    return 2*sin(2*cos(radians((r-i)/2)));
  }
  float h2val(int i)
  {
    return 45+10*sin((radians((r-i)/2)));
  }
  
  
  
  IntList xp = new IntList();
  float rp = 19, sc = 0.85; 
  int tp = 0, yp = 50, yq = 150;

  void troubleshoot()
  {
    strokeWeight(1);
    stroke(255, 100);
    line(160, yp+2*rp, 160, yp-2*rp);  
    line(160, 12+yq+2*rp, 160, -12+yq-2*rp);
    line(160, yq, width, yq);  
    line(160, 12+yq+2*rp, width, 12+yq+2*rp);  
    line(160, -12+yq-2*rp, width, -12+yq-2*rp);
    stroke(255, 200);
    text("T", 150, yp);
    text("CurveY", 115, yq);
    xp.append(tp++);
    for (int i = 0; i<xp.size(); i++) {
      if (xp.get(i) <=width)
        stroke(#C1E850);  
      point(160+xp.get(i), yp+rp*tval(i));
      stroke(#E85092);  
      point(160+xp.get(i), yq+rp*curveY(i, true)*sc);
      stroke(#50B6E8);  
      point(160+xp.get(i), yq+rp*curveY(i, false)*sc);
    }
    strokeWeight(4);
    stroke(#50E88B);  
    point(160, yp +rp*tval(0));
    stroke(#FF5596);  
    point(160, yq +rp*curveY(0, true)*sc);
    stroke(#50D2E8);  
    point(160, yq +rp*curveY(0, false)*sc);
  }
  void tshoot(int x)
  {
    fill(255);
    text(a2 + "  " + h2, x, y-120);
    text(x, x, y-100);
    text(h + "  " + (y +((h*(h2/a2)*sin(radians(a))))), x, y-80);
    text(t, 30, 30);
    text((up)? "true" : "false", 30, 60); 
    text("        " + h2, 30, 60);
    noFill();
  }
}