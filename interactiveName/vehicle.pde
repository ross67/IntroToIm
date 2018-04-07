class Vehicle{

PVector position;
PVector velocity;
PVector acceleration;

boolean mouseClose = false;
float maxForce; //max steering force (how fast it can turn around)
float maxSpeed; // max speed

  Vehicle(float x, float y){
    acceleration = new PVector(0,0);
    velocity = new PVector(0,-2);
    position = new PVector(x,y);
    maxSpeed = 4;
    maxForce = 0.1;
  }
 
    // Method to update position
  void update() {

    // Update velocity
    velocity.add(acceleration);
    // Limit speed
    velocity.limit(maxSpeed);
    position.add(velocity);
    // Reset accelerationelertion to 0 each cycle
    acceleration.mult(0);
   }
   
   void applyForce(PVector force) {
    // We could add mass here if we want A = F / M
    acceleration.add(force);
  }
  
  void arrive(PVector target){
        checkMouse();
        PVector desired = PVector.sub(target,position);  // A vector pointing from the position to the target
     if(mouseClose){
       PVector mouse = new PVector(mouseX,mouseY);
        desired = PVector.sub(mouse,position);  // A vector pointing from the position to the cursor
     }
     float d = desired.mag(); // distance b/w position and target
     
    if (d < 100) { 
      float m = map(d,0,100,0,maxSpeed); // if vehicle is close enough, slow down
      desired.setMag(m);
    } else {
      desired.setMag(maxSpeed); // or else set it to max speed
    }
     
       // Steering = Desired minus Velocity (could potential move backwards)
    PVector steer = PVector.sub(desired,velocity);
    steer.limit(maxForce);  // Limit to maximum steering force
    applyForce(steer);    
  }
  
    void display() {   
    ellipse(position.x, position.y, 6, 6);      
  }
  
    void checkMouse() {
      PVector mouse = new PVector(mouseX,mouseY);
      float d = PVector.sub(mouse,position).mag();
      
    if (d<333 && mouseX!=pmouseX && mouseY!=pmouseY) {
      mouseClose = true;
      println(d);
    }else{
      mouseClose = false;
    }
  }
}