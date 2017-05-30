public class Ship{
  PShape s;
  float x,y,z;
  String address = "data/spaceship/cruiser.obj";
  PGraphics canvas;
  
  public Ship(PGraphics cnv, int i, int j, int k){
    s = loadShape(address);
    s.scale(0.01);
    x = i;
    y = j;
    z = k;
    canvas = cnv;
  }
  
  public void draw(){
    canvas.shape(s,x,y);
  }
  
}