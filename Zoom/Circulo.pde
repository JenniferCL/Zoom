class Circulo{
  Body ci;
  float r;
  
  Circulo(float x, float y, float r_, boolean u){
    r = r_;
    
    BodyDef cir = new BodyDef();
    if(u) cir.type = BodyType.STATIC;
    else cir.type = BodyType.DYNAMIC;
    
    cir.position = box2d.coordPixelsToWorld(x,y);
    ci = box2d.world.createBody(cir);
    
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    
    fd.density=1;
    fd.friction = 0.3;
    fd.restitution = 0.5;
    
    ci.createFixture(fd);
  }
  void killBody(){
    box2d.destroyBody(ci);
  }
  boolean done(){
    Vec2 pos =box2d.getBodyPixelCoord(ci);
   if (pos.y > width+r*2){
     killBody();
     return true;
   }
   return false;
  }
  void display(){
   Vec2 pos = box2d.getBodyPixelCoord(ci);
   float a = ci.getAngle();
   pushMatrix();
   translate (pos.x,pos.y);
   rotate(a);
    stroke(#03FFFD);
    fill(#03FFFD,50);
   ellipse(0,0,r*2,r*2);
   popMatrix();
  }
}