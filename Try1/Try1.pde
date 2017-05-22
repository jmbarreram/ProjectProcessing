import remixlab.proscene.*;
import remixlab.dandelion.core.*;
import remixlab.dandelion.geom.*;

Scene scene;
Box [] cajas;
PShape s;

void setup() {
  size(800, 720, P3D);
  scene = new Scene(this);
  scene.setAxesVisualHint(false);
  scene.setDottedGrid(false);
  scene.setCameraType(Camera.Type.ORTHOGRAPHIC);
  scene.setGridVisualHint(false);
  scene.setRadius(160);
  scene.showAll();
  
  cajas = new Box[27];
  for(int i = 0; i < 3; i++){
    for(int j = 0; j < 3; j++){
      for(int k = 0; k < 3; k++){
        cajas[k+(j+(i*3))*3] = new Box(scene, i-1, j-1, k-1);
      }
    }
  }
  pushMatrix();
  s = loadShape("data/spaceship/cruiser.obj");
  s.scale(0.2);
  popMatrix();
}

void draw() {
  background(0);
  pushMatrix();
  rotateX(PI);
  //translate(width/2, height/2);
  shape(s, 0, 0);
  popMatrix();
  for(int i = 0; i < cajas.length; i++){
    cajas[i].draw();
  }
  
}