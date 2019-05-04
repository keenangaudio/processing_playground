String print = "hello";
char input;
void setup()
{
  size(500,500);
  textAlign(CENTER);
}
void draw()
{
  background(200);
  text(print,width/2,height/2);
  println(print);
}
void keyPressed()
{
  println(keyCode);
  input = char(keyCode);
  if ((keyCode == 8 || keyCode == 16) && print.length() > 0)
    print = print.substring(0,print.length()-1);
  else
    print += input;
}