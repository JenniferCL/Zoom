import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;


Box2DProcessing box2d;
Puente pte;
Puente pt;
Jugador jugador1;
ArrayList<Obstaculo1> obstaculos1;
ArrayList<Obstaculo2> obstaculos2;
ArrayList<Obstaculo3> obstaculos3;
ArrayList<Obstaculo4> obstaculos4;
ArrayList<Obstaculo5> obstaculos5;
ArrayList<Obstaculo6> obstaculos6;
ArrayList<PrimeraPantalla> primerapantalla;
int pantalla;
Suelo suelo;
Suelo techo;
PFont letra1;
PFont letra2;
int s,r;
int Count1;
float t1,t2,t3,t4,t5;

void setup() {
  size(640,360);
  smooth();
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  
  box2d.setGravity(0,0.00005);
  box2d.listenForCollisions();
  
  jugador1 = new Jugador (320,340);
  primerapantalla = new ArrayList<PrimeraPantalla>();
  obstaculos1 = new ArrayList<Obstaculo1>();
  obstaculos2 = new ArrayList<Obstaculo2>();
  obstaculos3 = new ArrayList<Obstaculo3>();
  obstaculos4 = new ArrayList<Obstaculo4>();
  obstaculos5 = new ArrayList<Obstaculo5>();
  obstaculos6 = new ArrayList<Obstaculo6>();
  pte = new Puente (height,height/10,3);
  pt = new Puente (height,height/10,1.5);
  suelo = new Suelo(width/2, height-5, width, 10);
  
  letra1=loadFont("Arcade-150.vlw");
  letra2=loadFont("Videophreak-20.vlw");
  t1=130;
  t2=130;
  t3=130;
  t4=130;
  t5=130;
}

void draw(){
  background(#010215);
  box2d.step();
  println(pantalla);
  switch (pantalla){
    case 0:
    if (frameCount%50 ==0){
      primerapantalla.add(new PrimeraPantalla(320,-20));
      primerapantalla.add(new PrimeraPantalla(30,-20));
      primerapantalla.add(new PrimeraPantalla(630,-20));
    }
    for (PrimeraPantalla b:primerapantalla){
      b.display();
    }
  for (int i = primerapantalla.size ()-1; i>=0; i--){
    PrimeraPantalla b = primerapantalla.get (i);
    if (b.done()){
      primerapantalla.remove(i);
    }
  }
  suelo.display();
  for (int i=0; i<width; i=i+10){
    ellipseMode(CENTER);
    stroke(#03FFFD);
    fill(#03FFFD,50);
    ellipse (5+i,45,10,10);
    ellipse (5+i,185,10,10);
  }
  for (int i=0; i<height; i=i+10){
    ellipseMode(CENTER);
    ellipse (145,5+i,10,10);
    ellipse (495,5+i,10,10);
  }
  textFont(letra1);
  textAlign(CENTER,CENTER);
  stroke(255);
  fill(255);
  text("Zoom",320,135);
  fill(#FFFD50);
  stroke(#FFFD50);
  textFont(letra2);
  text("Iniciar",320,300);
  if ((mouseX>280)&(mouseX<360)&(mouseY>285)&(mouseY<315)){
    cursor(HAND);
  }
  else{
    cursor(ARROW);
  }
    break;
    case 1:
    rectMode(CORNER);
    fill(255,0,0);
    noStroke();
    rect(500,20,130,10);
    rectMode(CORNER);
    fill(255);
    noStroke();
    rect(500,20,t1,10);
    t1=t1-.5;
    println (t1);
    if (t1==0){
      pantalla=7;
    }
    jugador1.Coord();
    cursor(ARROW);
  rectMode(CENTER);
    fill(255,0,0,20);
    stroke(255,0,0);
  rect(320,10,20,20);
  pte.display();
  pt.display();
  jugador1.display();
  jugador1.mover();
  if (frameCount%21 ==0){
    obstaculos1.add(new Obstaculo1 (420,10));
    obstaculos1.add(new Obstaculo1 (220,10));
    obstaculos1.add(new Obstaculo1 (320,-20));
  }
  for (Obstaculo1 b:obstaculos1){
    b.display();
  }
  for (int i = obstaculos1.size ()-1; i>=0; i--){
    Obstaculo1 b = obstaculos1.get (i);
    if (b.done()){
      obstaculos1.remove(i);
    }
  }
  jugador1.Empuje();
  if (s>=295 && s<=345 && r<=35){
    pantalla ++;
    for (Obstaculo1 b:obstaculos1){
      b.killBody();
    }
  }
    break;
    case 2:
    rectMode(CORNER);
    fill(255,0,0);
    noStroke();
    rect(500,20,130,10);
    rectMode(CORNER);
    fill(255);
    noStroke();
    rect(500,20,t2,10);
    t2=t2-.5;
    println (t2);
    if (t2==0){
      pantalla=7;
    }
    jugador1.Coord();
    cursor(ARROW);
  rectMode(CENTER);
    fill(255,0,0,20);
    stroke(255,0,0);
  rect(320,340,20,20);
  pte.display();
  pt.display();
  jugador1.display();
  jugador1.mover();
  if (frameCount%21 ==0){
    obstaculos2.add(new Obstaculo2 (320,340));
    obstaculos2.add(new Obstaculo2 (420,340));
    obstaculos2.add(new Obstaculo2 (220,340));
  }
  for (Obstaculo2 b:obstaculos2){
    b.display();
  }
  for (int i = obstaculos2.size ()-1; i>=0; i--){
    Obstaculo2 b = obstaculos2.get (i);
    if (b.done()){
      obstaculos2.remove(i);
    }
  }
  jugador1.Empuje();
  if (s>=295 && s<=345 && r>=320){
    pantalla ++;
    for (Obstaculo2 b:obstaculos2){
      b.killBody();
    }
  }
    break;
    case 3:
    rectMode(CORNER);
    fill(255,0,0);
    noStroke();
    rect(500,20,130,10);
    rectMode(CORNER);
    fill(255);
    noStroke();
    rect(500,20,t3,10);
    t3=t3-.2;
    println (t3);
    if (t3==0){
      pantalla=7;
    }
    jugador1.Coord();
    cursor(ARROW);
  rectMode(CENTER);
    fill(255,0,0,20);
    stroke(255,0,0);
  rect(450,180,20,20);
  pte.display();
  pt.display();
  jugador1.display();
  jugador1.mover();
  if (frameCount%21 ==0){
    obstaculos3.add(new Obstaculo3 (620,120));
    obstaculos3.add(new Obstaculo3 (620,220));
    obstaculos3.add(new Obstaculo3 (420,300));
  }
  for (Obstaculo3 b:obstaculos3){
    b.display();
  }
  for (int i = obstaculos3.size ()-1; i>=0; i--){
    Obstaculo3 b = obstaculos3.get (i);
    if (b.done()){
      obstaculos3.remove(i);
    }
  }
  jugador1.Empuje();
  if (s>=420 && r>=145 && r<=215){
    pantalla ++;
    for (Obstaculo3 b:obstaculos3){
      b.killBody();
    }
  }
  break;
  case 4:
    rectMode(CORNER);
    fill(255,0,0);
    noStroke();
    rect(500,20,130,10);
    rectMode(CORNER);
    fill(255);
    noStroke();
    rect(500,20,t4,10);
    t4=t4-.2;
    println (t4);
    if (t4==0){
      pantalla=7;
    }
  jugador1.Coord();
    cursor(ARROW);
  rectMode(CENTER);
    fill(255,0,0,20);
    stroke(255,0,0);
  rect(200,180,20,20);
  pte.display();
  pt.display();
  jugador1.display();
  jugador1.mover();
  if (frameCount%21 ==0){
    obstaculos4.add(new Obstaculo4 (20,120));
    obstaculos4.add(new Obstaculo4 (20,220));
  }
  for (Obstaculo4 b:obstaculos4){
    b.display();
  }
  for (int i = obstaculos4.size ()-1; i>=0; i--){
    Obstaculo4 b = obstaculos4.get (i);
    if (b.done()){
      obstaculos4.remove(i);
    }
  }
  jugador1.Empuje();
  if (s<=225 && r>=145 && r<=215){
    pantalla ++;
    for (Obstaculo4 b:obstaculos4){
      b.killBody();
    }
  }
  break;
  case 5:
    rectMode(CORNER);
    fill(255,0,0);
    noStroke();
    rect(500,20,130,10);
    rectMode(CORNER);
    fill(255);
    noStroke();
    rect(500,20,t5,10);
    t5=t5-.2;
    println (t5);
    if (t5==0){
      pantalla=7;
    }
  jugador1.Coord();
    cursor(ARROW);
  rectMode(CENTER);
    fill(255,0,0,20);
    stroke(255,0,0);
  rect(450,180,20,20);
  pte.display();
  pt.display();
  jugador1.display();
  jugador1.mover();
  if (frameCount%21 ==0){
    obstaculos5.add(new Obstaculo5 (620,120));
    obstaculos5.add(new Obstaculo5 (620,220));
    obstaculos6.add(new Obstaculo6 (320,20));
  }
  for (Obstaculo5 b:obstaculos5){
    b.display();
  }
  for (int i = obstaculos5.size ()-1; i>=0; i--){
    Obstaculo5 b = obstaculos5.get (i);
    if (b.done()){
      obstaculos5.remove(i);
    }
  }
  for (Obstaculo6 b:obstaculos6){
    b.display();
  }
  for (int i = obstaculos6.size ()-1; i>=0; i--){
    Obstaculo6 b = obstaculos6.get (i);
    if (b.done()){
      obstaculos6.remove(i);
    }
  }
  jugador1.Empuje();
  if (s>=420 && r>=145 && r<=215){
    pantalla =6;
    for (Obstaculo5 b:obstaculos5){
      b.killBody();
    }
    for (Obstaculo6 b:obstaculos6){
      b.killBody();
    }
  }
  break;
  case 6:
  textFont(letra1);
  textAlign(CENTER,CENTER);
  stroke(255);
  fill(255);
  text("GANASTE",320,135);
  fill(#FFFD50);
  stroke(#FFFD50);
  textFont(letra2);
  text("Cerrar",320,300);
  if ((mouseX>280)&(mouseX<360)&(mouseY>285)&(mouseY<315)){
    cursor(HAND);
  }
  else{
    cursor(ARROW);
  }
  break;
  case 7:
  textFont(letra1);
  textAlign(CENTER,CENTER);
  stroke(255);
  fill(255);
  text("PERDISTE",320,135);
  fill(#FFFD50);
  stroke(#FFFD50);
  textFont(letra2);
  text("Cerrar",320,300);
  if ((mouseX>280)&(mouseX<360)&(mouseY>285)&(mouseY<315)){
    cursor(HAND);
  }
  else{
    cursor(ARROW);
  }
  break;
  }
}

void mouseReleased(){
  switch (pantalla){
  case 0:
  if ((mouseX>280)&(mouseX<360)&(mouseY>285)&(mouseY<315)){
    pantalla=1;
    suelo.killBody();
    for (PrimeraPantalla b:primerapantalla){
      b.killBody();
    }
  }
  break;
  case 6:
  if ((mouseX>280)&(mouseX<360)&(mouseY>285)&(mouseY<315)){
    exit();
  }
  break;
  case 7:
  if ((mouseX>280)&(mouseX<360)&(mouseY>285)&(mouseY<315)){
    exit();
  };
  }
}