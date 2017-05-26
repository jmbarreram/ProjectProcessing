import remixlab.proscene.*;
import remixlab.dandelion.core.*;
import remixlab.dandelion.geom.*;

Scene scene, auxScene;
Box [] cajas;
PShape s;
PGraphics canvas, auxCanvas;  
InteractiveFrame frame1, frame2, frame3, auxFrame1, auxFrame2, auxFrame3;
InteractiveFrame iFrame;

int w = 800;
int h = 720;
int oW = w/3;
int oH = h/3;
int oX = w - oW;
int oY = h - oH;
boolean showMiniMap  = true;

void settings(){
  size(800, 720, P3D);
}

void setup() {
  
  canvas = createGraphics(w, h, P3D);
  scene = new Scene(this, canvas);
  frame1 = new InteractiveFrame(scene, "frameDrawing");
  frame1.translate(30,30);
  frame2 = new InteractiveFrame(scene, frame1, "frameDrawing");
  frame2.translate(40,0);
  frame3 = new InteractiveFrame(scene, frame2, "frameDrawing");
  frame3.translate(40, 0);
  
  auxCanvas = createGraphics(oW, oH, P3D);
  auxScene = new Scene(this, auxCanvas, oX, oY);
  auxScene.setAxesVisualHint(false);
  auxScene.setDottedGrid(false);
  auxScene.setCameraType(Camera.Type.ORTHOGRAPHIC);
  auxScene.setGridVisualHint(false);
  auxScene.setRadius(160);
  auxScene.showAll();
  
  auxFrame1 = new InteractiveFrame(auxScene);
  auxFrame1.set(frame1);
  auxFrame2 = new InteractiveFrame(auxScene, auxFrame1);
  auxFrame2.set(frame2);
  auxFrame3 = new InteractiveFrame(auxScene, auxFrame2);
  auxFrame3.set(frame3);

  iFrame = new InteractiveFrame(auxScene);
  //to not scale the iFrame on mouse hover uncomment:
  //iFrame.setHighlightingMode(InteractiveFrame.HighlightingMode.NONE);
  iFrame.setWorldMatrix(scene.eyeFrame());
  iFrame.setShape(scene.eyeFrame());
  
  cajas = new Box[27];
  for(int i = 0; i < 3; i++){
    for(int j = 0; j < 3; j++){
      for(int k = 0; k < 3; k++){
        cajas[k+(j+(i*3))*3] = new Box(canvas, scene, i-1, j-1, k-1);
      }
    }
  }
  pushMatrix();
  s = loadShape("data/spaceship/cruiser.obj");
  s.scale(0.2);
  popMatrix();
}

void draw() {
  InteractiveFrame.sync(scene.eyeFrame(), iFrame);
  InteractiveFrame.sync(frame1, auxFrame1);
  InteractiveFrame.sync(frame2, auxFrame2);
  InteractiveFrame.sync(frame3, auxFrame3);
  scene.beginDraw();
  canvas.background(0);
  //scene.drawFrames();
  scene.endDraw();
  scene.display();
  
  auxScene.beginDraw();
  auxCanvas.background(29, 153, 243);
  auxScene.pg().fill(255, 0, 255, 125);
  auxScene.drawFrames();
  auxScene.endDraw();
  auxScene.display();
  
  pushMatrix();
  canvas.rotateX(PI);
  //rotateX(PI);
  //translate(width/2, height/2);
  canvas.shape(s,30,30);
  //shape(s, 300,-300);
  popMatrix();
  
  /*
  for(int i = 0; i < cajas.length; i++){
    cajas[i].draw();
  }*/
  
}