void keyPressed()
{
  if (keyCode == RIGHT){
    r+=12;  println("Radius: "+r);
  }
  else if (keyCode == LEFT){
    r-=12;  println("Radius: "+r);
  }
  else if (keyCode == UP){
    zoom+=20;  println("Zoom: "+zoom);
  }
  else if (keyCode == DOWN){
    zoom-=20;  println("Zoom: "+zoom);
  }
  else if (keyCode == ']'){
    sWeight+=1;  println("Stroke Weight: "+sWeight);
  }
  else if (keyCode == '['){
    sWeight-=1;  println("Stroke Weight: "+sWeight);
  }
  else if (keyCode == '0'){
    dev++;  println("Deviation: "+(float)dev/10);
  }
  else if (keyCode == '9'){
    dev--;  println("Deviation: "+(float)dev/10);
  }
  else if (keyCode == 32){
    resu = !resu;//(resu)? false:true;
    println((resu)? "Point Mode":"Surface Mode");
  }
  else if (keyCode == 'P'){
    projMode = !projMode;//(resu)? false:true;
    println((projMode)? "Perspective Mode":"Orthographic Mode");
  }
  else if (keyCode == 'C'){
    colmode = !colmode;
    println((colmode)? "Colour Mode":"Greyscale Mode");
  }
  else if (keyCode == 'R'){
    real = !real;
    println((real)? "Realism Mode":"Classic Mode");
  }
  if (keyCode == '.'){
    ren_qual+=(ren_qual<rQMax)?2:0;
    println("Render Quality: "+ren_qual);
  }
  else if (keyCode == ','){
    ren_qual-=(ren_qual>3)?2:0;
    println("Render Quality: "+ren_qual);
  }
  if (keyCode == '='){
    sea+=0.1;
    println("Sea Level: "+sea);
  }
  else if (keyCode == '-'){
    sea-=0.1;
    println("Sea Level: "+sea);
  }
  setup();
}
