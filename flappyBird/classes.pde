
class Bird{
  
  float locx, locy;

  
  Bird(float x,float y){
    locx = x;
    locy = y;    
  }
  
  //void gravity(){
  //    // Add speed to location.
  //    locy = locy + speed;

  //// Add gravity to speed.
  //   speed = speed + gravity;

    
  //}
  
  void draw(PImage img ){
    
    image(img,locx,locy);
    
  }
    
  boolean onCollision(Tube a) {

  // are the sides of one rectangle touching the other?

  if (locx + 36 >= a.locx &&    // r1 right edge past r2 left
      locx <= a.locx + a.xlen &&    // r1 left edge past r2 right
      locy + 26 >= a.locy &&    // r1 top edge past r2 bottom
      locy <= a.locy + a.ylen) {    // r1 bottom edge past r2 top
        return true;
  }
  return false;
}
  
//http://www.jeffreythompson.org/collision-detection/rect-rect.php
  
}

class Tube{
 int locx, locy, xlen, ylen, hSpeed;
 
 Tube(int x,int y, int xl, int yl, int hs){
   locx = x;
   locy = y;
   xlen = xl;  
   ylen = yl;
   hSpeed = hs;
 }
 
   void draw(){   
    image(tube1,locx,locy,xlen,ylen);
    locx -= hSpeed;
  }
  

  void drawInverse(){
    image(tube2,locx,locy,xlen, ylen);
    locx -= hSpeed;

  }
  
  void setX(int x){
    locx =x;
  }
      
}