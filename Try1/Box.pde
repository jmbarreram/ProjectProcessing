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
  PGraphics canvas;
  Scene scene;
  public InteractiveFrame iFrame;
  float w, h, d;
  int x,y,z;
  int c;
  boolean shipFlag;
  Ship ship;
  PShape s;

  public Box(Scene scn, InteractiveFrame iF) {
    scene = scn;
    iFrame = iF;
    setSize();
    shipFlag = false;
    
    s = loadShape("data/spaceship/cruiser.obj");
    s.scale(0.1);
  }

  public Box(Scene scn) {
    scene = scn;
    iFrame = new InteractiveFrame(scn);
    setSize();   
    setPosition();
    shipFlag = false;
  }
  
  public Box(Scene scn, int x, int y, int z) {
    scene = scn;
    iFrame = new InteractiveFrame(scn);
    setSize();   
    setPosition(x,y,z);
    shipFlag = false;
  }
  
  public Box(PGraphics cnv, Scene scn, int x, int y, int z) {
    canvas = cnv;
    scene = scn;
    iFrame = new InteractiveFrame(scn);
    setSize();   
    setPosition(x,y,z);
    shipFlag = false;
    iFrame.removeClickBindings();
    iFrame.removeMotionBindings();
    scene.removeBindings();
    iFrame.setClickBinding(this, LEFT, 1, "boxCustomClick");
    iFrame.setClickBinding(this, LEFT, 2, "boxCustomClick");
    iFrame.setRotationSensitivity(0);
    ship = new Ship(canvas,x,y,z);
  }

  public void draw() {
    pushMatrix();
    iFrame.applyWorldTransformation();
    canvas.noFill();
    canvas.stroke(255);
    if (scene.motionAgent().isInputGrabber(iFrame))
      canvas.strokeWeight(3);
    else
      canvas.strokeWeight(1);
    canvas.box(w, h, d);
    if (shipFlag)
      ship.draw();
    popMatrix();
  }

  public void setSize() {
    w = 10;
    h = 10;
    d = 10;
    iFrame.setPickingPrecision(InteractiveFrame.PickingPrecision.ADAPTIVE);
  }

  public void setSize(float myW, float myH, float myD) {
    w=myW; 
    h=myH; 
    d=myD;
    iFrame.setPickingPrecision(InteractiveFrame.PickingPrecision.ADAPTIVE);
  }
  
  public void setPosition(int x, int y, int z){
    this.x = x;
    this.y = y;
    this.z = z;
    iFrame.setPosition(new Vec(w*x,h*y,d*z));
  }

  public void setPosition() {
    float low = -10;
    float high = 10;
    iFrame.setPosition(new Vec(random(low, high), random(low, high), random(low, high)));
  }
  
  public boolean boxOn(int x2, int y2, int z2){
    return x == x2 && y == y2 && z == z2;
  }
  
  void boxCustomClick(InteractiveFrame frame){
    shipFlag = true;
  }
}