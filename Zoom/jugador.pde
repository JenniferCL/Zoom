class Jugador{
  Body jgdor;
  float w; 
  float h;
  Jugador(int x, int y){
    w = 30;
    h = 30;
    makeBody(x,y,w,h);
    jgdor.setUserData(this);
  }
  void display(){
    Vec2 pos = box2d.getBodyPixelCoord(jgdor);
    pushMatrix();
    translate (pos.x,pos.y);
    fill(255,0,0,50);
    stroke(255,0,0);
    rectMode(CENTER);
    rect(0,0,30,30);
    popMatrix();
  }
  void mover(){
    Vec2 m = new Vec2(0,0);
    Vec2 pos = jgdor.getWorldCenter();
    
    if (keyPressed ==true && key == CODED && keyCode==UP){
      m.y +=50;
    }
    if (keyPressed ==true && key == CODED && keyCode==DOWN){
      m.y -=50;
    }
    if (keyPressed ==true && key == CODED && keyCode==LEFT){
      m.x -=50;
    }
    if (keyPressed ==true && key == CODED && keyCode==RIGHT){
      m.x +=50;
    }
    jgdor.applyForce(m,pos);
  }
  void makeBody (float x,float y, float w_, float h_){
    BodyDef ju = new BodyDef();
    ju.position = box2d.coordPixelsToWorld(x,y);
    ju.type = BodyType.DYNAMIC;
    jgdor =box2d.createBody(ju);
    
    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w_/2);
    float box2dH = box2d.scalarPixelsToWorld(h_/2);
    sd.setAsBox(box2dW,box2dH);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = sd;
    fd.density =.2;
    fd.friction = 0.3;
    
    jgdor.createFixture(fd);
    
  }
  void killBody(){
    box2d.destroyBody(jgdor);
  }
  void Coord(){
    Vec2 pos = box2d.getBodyPixelCoord(jgdor);
    s = round (pos.x);
    r = round (pos.y);
  }
  void Empuje(){
    Vec2 pos = box2d.getBodyPixelCoord(jgdor);
    if (pos.y<=0){
    jgdor.setLinearVelocity(new Vec2(0,-10));
    }
    else{
    if (pos.y>=360){
    jgdor.setLinearVelocity(new Vec2(0,10));
    }
    }
  }
}