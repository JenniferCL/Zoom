class Puente{
 float tam;
 int numC;
 float zeta;
 int ache;
 ArrayList<Circulo> circulos;
 Puente (float t,int n, float z){
   tam = t;
   numC = n;
   zeta = z;
   circulos = new ArrayList();
   float tno = tam / numC;
   for (int i=0; i<numC+1;i++){
     Circulo c = null;
     
     if (i ==0 || i == numC) c = new Circulo(width/z,i*tno,4,true);
     else c = new Circulo (width/z,i*tno,4,false);
     circulos.add(c);
     
     if (i >0){
       DistanceJointDef djd = new DistanceJointDef();
       Circulo previous = circulos.get(i-1);
       djd.bodyA = previous.ci;
       djd.bodyB = c.ci;
       djd.length = box2d.scalarPixelsToWorld(tno);
       djd.frequencyHz = 0;
       djd.dampingRatio = 0;
      DistanceJoint dj = (DistanceJoint) box2d.world.createJoint(djd);
     }
 }
}
 void display(){
   for(Circulo c: circulos){
     c.display();
 }
 }
 void killBody(){
    for (Circulo c:circulos){
      c.killBody();
    }
 }
}