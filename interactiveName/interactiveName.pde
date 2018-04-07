//Thanks to Daniel Shiffman for explanation on steering behaviors on his Youtube Channel:https://www.youtube.com/user/shiffman

// the vehicle class is modified from his coding example on https://www.youtube.com/watch?v=4zhJlkGQTvU

import geomerative.*;
String fontName = "IndieFlower.ttf";
String textTyped = "Ross Jiang";
RFont font;
RPoint[] pnts;
Vehicle[] vehicles = new Vehicle[600];

void setup(){
    //size(800, 600);
    size(1440,900);
    background(51);
    noFill();
    stroke(255);
   RG.init(this);
  font = new RFont(fontName, 230, RFont.LEFT);

  RCommand.setSegmentLength (10);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
  RGroup grp;
  grp = font.toGroup(textTyped);
  grp = grp.toPolygonGroup();
  pnts = grp.getPoints();
  
//define the vehicles

  for (int i=0; i<150; i++){ //left 
      Vehicle v = new Vehicle(0, i*9.6);
      vehicles[i] = v;   
  }
  
   for (int j=150; j<300; j++){ //right
      Vehicle v = new Vehicle(1440, (j-150)*9.6);
      vehicles[j] = v;   
  }
  
  for (int k=300; k<450; k++){ //top
      Vehicle v = new Vehicle((k-300)*6, 0);
      vehicles[k] = v;   
  }
  
  for (int l=450; l<600; l++){ //bot
     Vehicle v = new Vehicle((l-450)*6, 900);
     vehicles[l] = v;   
  }
      
}

void draw(){
  
     background(51);
    
  int index = 0;
  for (Vehicle v: vehicles){
    
  PVector p = new PVector(pnts[index].x+250,pnts[index].y+400);
  v.arrive(p);
  v.update();
  v.display(); 
  index++;
    
  }
  
}