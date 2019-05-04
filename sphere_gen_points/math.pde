void drawSurface(int i, int j,boolean surface)
{
  //noStroke();
  if ( surface && !real )
  {
    strokeWeight(++sWeight);
    stroke(200);
    line(0,0,0,sPoint[i][j].x,sPoint[i][j].y,sPoint[i][j].z);
    strokeWeight(5*sWeight);
    if (colmode) stroke(col[i][j].x,col[i][j].y,col[i][j].z);else stroke(120);
    point(sPoint[i][j].x,sPoint[i][j].y,sPoint[i][j].z);
    strokeWeight(--sWeight);
  }
  else
  beginShape();//TRIANGLE_STRIP or TRIANGLE_FAN
   
    sPointVertex(i,j,0,0);
    
    if (j+1<(ren_qual))
      sPointVertex(i,j,0,1);
    else if (j+1==(ren_qual))
      sPointVertex(i,0,0,0);
    else 
      sPointVertex((ren_qual),0,-1,0);
      
    //sPointVertex(i,j,0,0);
    if (j+1<(ren_qual) && i+1<(ren_qual))
      sPointVertex(i,j,1,1);
    else if (j+1==(ren_qual) && i+1<(ren_qual))
      sPointVertex(i,j,1,0);
    else if (j+1<(ren_qual) && i+1==(ren_qual))
      sPointVertex(i,j,0,1);
    else
      sPointVertex((ren_qual),(ren_qual),-1,-1);  
    //sPointVertex(i,j,0,0);
    
    if (i+1<(ren_qual))
      sPointVertex(i,j,1,0);
    else if (i+1==(ren_qual))
      sPointVertex(0,j,0,0);
    else 
      sPointVertex(0,(ren_qual),0,-1);
      
    sPointVertex(i,j,0,0);
    
  endShape();
}

void sPointVertex(int i, int j, int x, int y)
{
  vertex(t*sPoint[i+x][j+y].x,t*sPoint[i+x][j+y].y,t*sPoint[i+x][j+y].z);
}

void origin(int x,int y,int z)
{
  strokeWeight(2);
  textAlign(CENTER);
  stroke(255,0,0);
  line(x,y,z-30,x,y,z+30);
  text("X",x,y,z-30);
  
  stroke(0,255,0);
  line(x-30,y,z,x+30,y,z);
  text("Y",x-30,y,z);
  
  stroke(0,0,255);
  line(x,y-30,z,x,y+30,z);
  text("Z",x,y-30,z);
  
  stroke(0);
  textAlign(LEFT);
  strokeWeight(sWeight);
}

PVector spherePoint(float i,float j)
{
  float x, y, z, d, g;
  float irad = radians(map(i,0,ren_qual-1,0,360)),
        jrad = radians(map(j,0,ren_qual-1,0,180));
  d = (i == ren_qual-1 || j == ren_qual-1 || i == 0 || j == 0)? 0:1; //if the point is on any of the seams, it negates randomness
  g = (r +d*randomGaussian()*dev/10 );
  x = g*cos(irad)*sin(jrad);
  y = g*sin(irad)*sin(jrad);
  z = g*cos(jrad);
  return new PVector(x,y,z);
}

void create(PShape x)
{
  x.beginShape();
  x.vertex(0,4);
  x.vertex(12,4);
  x.vertex(12,8);
  x.vertex(16,0);
  x.vertex(12,-8);
  x.vertex(12,-4);
  x.vertex(0,-4);
  x.endShape();
}