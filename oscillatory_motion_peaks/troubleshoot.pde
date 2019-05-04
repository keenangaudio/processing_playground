IntList xp = new IntList();
float rp = 19, sc = 0.85; int tp = 0, yp = 50, yq = 150;

void troubleshoot()
{
  strokeWeight(1);stroke(255,100);
  line(160,yp+2*rp,160,yp-2*rp);  line(160,12+yq+2*rp,160,-12+yq-2*rp);
  line(160,yq,width,yq);  line(160,12+yq+2*rp,width,12+yq+2*rp);  line(160,-12+yq-2*rp,width,-12+yq-2*rp);
  stroke(255,200);
  text("T" ,150,yp);
  text("CurveY" ,115,yq);
  xp.append(tp++);
  for (int i = 0; i<xp.size();i++){
    if (xp.get(i) <=width)
    stroke(#C1E850);  point(160+xp.get(i),yp+rp*tval(i));
    stroke(#E85092);  point(160+xp.get(i),yq+rp*curveY(i,true)*sc);
    stroke(#50B6E8);  point(160+xp.get(i),yq+rp*curveY(i,false)*sc);
  }
  strokeWeight(4);
  stroke(#50E88B);  point(160,yp +rp*tval(0));
  stroke(#FF5596);  point(160,yq +rp*curveY(0,true)*sc);
  stroke(#50D2E8);  point(160,yq +rp*curveY(0,false)*sc);
}
void tshoot(int x)
{
  fill(255);
  text(a2 + "  " + h2,x,y-120);
  text(x ,x,y-100);
  text(h + "  " + (y +((h*(h2/a2)*sin(radians(a))))),x,y-80);
  text(t,30,30);
  text((up)? "true" : "false",30,60); text("        " + h2,30,60);
  noFill();
}