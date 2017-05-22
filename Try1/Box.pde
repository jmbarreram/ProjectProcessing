/*
  - Que las cajas no roten
  - Centrarlas
  - Escalamiento de las cajas
  - Desaparecer cajas al acercar la vista
  - Minimapa
  
  - Poner figuras
  - Hacer que las figuras se muevan
  - Apuntar y disparar
  - Choque
  - Naves por fuera, pegados en pantalla
*/

public class Box {
  Scene scene;
  public InteractiveFrame iFrame;
  float w, h, d;
  int c;

  public Box(Scene scn, InteractiveFrame iF) {
    scene = scn;
    iFrame = iF;
    setSize();
  }

  public Box(Scene scn) {
    scene = scn;
    iFrame = new InteractiveFrame(scn);
    setSize();   
    setPosition();
  }
  
  public Box(Scene scn, int x, int y, int z) {
    scene = scn;
    iFrame = new InteractiveFrame(scn);
    setSize();   
    setPosition(x,y,z);
  }

  public void draw() {
    pushMatrix();
    iFrame.applyWorldTransformation();
    noFill();
    stroke(255);
    if (scene.motionAgent().isInputGrabber(iFrame))
      strokeWeight(3);
    else
      strokeWeight(1);
    box(w, h, d);
    popMatrix();
  }

  public void setSize() {
    w = 30;
    h = 30;
    d = 30;
    iFrame.setPickingPrecision(InteractiveFrame.PickingPrecision.ADAPTIVE);
  }

  public void setSize(float myW, float myH, float myD) {
    w=myW; 
    h=myH; 
    d=myD;
    iFrame.setPickingPrecision(InteractiveFrame.PickingPrecision.ADAPTIVE);
  }
  
  public void setPosition(int x, int y, int z){
    iFrame.setPosition(new Vec(w*x,h*y,d*z));
  }

  public void setPosition() {
    float low = -100;
    float high = 100;
    iFrame.setPosition(new Vec(random(low, high), random(low, high), random(low, high)));
  }
}