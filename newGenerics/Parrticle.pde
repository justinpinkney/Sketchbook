class Particle{
  ArrayList interactions;
  PVector pos;
  PVector speed;
  PVector force;
  float mass;
  float drag;
  int age;
  boolean drawme;
  int state;
  color myColor;
  
  Particle(PVector pos_, PVector speed_){
    pos = pos_;
    speed = speed_;
    force = new PVector(0,0);
    mass = 100;
    drag = 0.99;
    age = 0;
    drawme = true;
    state = 1;
    myColor = color(random(0,255),random(0,255),random(0,255));
    
    interactions = new ArrayList();
    Interaction myInteraction1 = new Interaction(-100,1,5000,0);
    interactions.add(myInteraction1);
    Interaction myInteraction2 = new Interaction(-100,5,50,1);
    interactions.add(myInteraction2);
    Interaction myInteraction3 = new Interaction(2,50,1000,1);
    interactions.add(myInteraction3);
    
  }
  
  void update(){
    PVector accl = PVector.mult(force,(1/mass));
    speed.add(accl);
    force = new PVector(0,0);
    speed.mult(drag);
    pos.add(speed);
    //force.add(new PVector(0,1));
    age++;
  }
  
  void render(){
    noStroke();
    fill(myColor);
    //fill(color(255*noise(pos.x*0.01,pos.y*0.01+(0.001*age)),0,255*speed.heading()));
    //fill(color(255*noise(pos.x*0.01,pos.y*0.01+(0.001*age)),0,255*speed.mag()));
    if(drawme){
      ellipse(pos.x,pos.y,3,3);
    }
    //drawme = false;
  }
  
  void applyForce(PVector force_){
    force.add(force_);
  }
  
  void stateChange(){
//    if (temp==1){ drawme = true; }
//    if (temp==0){ drawme = false; }
//    else {drawme = !drawme;}
    drawme = !drawme;
    println(drawme);
  }
  
}
