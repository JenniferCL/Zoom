class Obstaculo6{
  Body obs;
  float w;
  float h;
  color col1;
  color col2;
  
  Obstaculo6 (float x, float y){
    w = 10;
    h = 10;
    makeBody(new Vec2(x,y),w,h);
    obs.setUserData(this);
    col1 =color(random(80,100));
    col2 =255;
  }
  boolean done(){
    Vec2 pos = box2d.getBodyPixelCoord(obs);
    if (pos.y > height+w*h){
      killBody();
      return true;
    }
    return false;
  }
  void display(){
    Vec2 pos =box2d.getBodyPixelCoord(obs);
    float a = obs.getAngle();   rectMode(CENTER);
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(-a);
    fill(col1);
    stroke(col2);
    rect(0,0,w,h);
    popMatrix();
  }
  void makeBody(Vec2 center, float w_,float h_){
    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w_/2);
    float box2dH = box2d.scalarPixelsToWorld(h_/2);
    sd.setAsBox(box2dW,box2dH);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = sd;
    fd.density =1;
    fd.friction =0.3;
    fd.restitution = 0.2;
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(center));
    bd.angle = random(TWO_PI);
    
    obs = box2d.createBody(bd);
    obs.createFixture(fd);
    
    obs.setLinearVelocity(new Vec2(0,random(-25,5)));
    obs.setAngularVelocity(random(-25,25));
    
  }
  
  void killBody(){
    box2d.destroyBody(obs);
  }
}