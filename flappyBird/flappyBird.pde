import processing.sound.*;
SoundFile hit;
SoundFile die;
SoundFile point;
SoundFile wing;

PImage backgroundImg;
PImage img1;
PImage img2;
PImage img3;
PImage img;
PImage tube1;
PImage tube2;
int background =0;
boolean state = false;
boolean gameOver = false;
float speed = 0;
float gravity = 0.1;
int score = 0;
int hSpeed = 2;


float x = 50;
float y = 200;

int tubeLength;

Bird bird;
Tube tube;

ArrayList<Tube> tubeListTop;
ArrayList<Tube> tubeListBot;

void setup(){
 size(600,600);
 //size(1440,900);
 backgroundImg = loadImage("bg.png");
 img1 = loadImage("upflap.png");
 img2 = loadImage("midflap.png");
 img3 = loadImage("downflap.png");  
 tube1 = loadImage("tube1.png"); 
 tube2 =loadImage("tube2.png");
 tubeListTop = new ArrayList<Tube>();
 tubeListBot = new ArrayList<Tube>();
 img = img3;
 
 hit = new SoundFile(this, "hit.wav");
 die = new SoundFile(this, "die.wav");
 point = new SoundFile(this,"point.wav");
 wing = new SoundFile(this, "wing.wav");
 

 
 for (int i=0; i<4;i++){
  tubeLength =int(random(120,225));
  tubeListTop.add(new Tube(660+180*i,0,60,tubeLength, hSpeed)); 
}

for (int i=0; i<4;i++){
  tubeLength =int(random(120,225));
  tubeListBot.add(new Tube(660+180*i,505-tubeLength,60,tubeLength,hSpeed));   
}

}


  void draw(){ 
    
  if(!gameOver){
    image(backgroundImg,0,0);
    
    bird = new Bird(x, y);
    textSize(20);
    fill(0, 102, 153);
    text("PRESS SPACEBAR TO FLY", 80,580);
    fill(255,0,0);
    text("Socre: " + score, 450, 580);

  
    //if(keyPressed==true){ // use keyboard to move bird
    //  if(key == 'w'){
    //     y--; 
    //  }else if(key== 'a'){
    //     x--; 
    //  }else if(key=='d'){
    //   x++; 
    //  }else if(key=='s'){
    //   y++; 
    //  }
    //}
   for(Tube tube:tubeListTop){
     
     if(tube.locx<-60){
      tube.setX(680); 
     }
     
     tube.draw();
     
   }
    

   for(Tube tube:tubeListBot){
     
     if(tube.locx<-60){
      tube.setX(680); 
     }
     
     if (bird.locx == tube.locx){
      score++; 
      point.play();
     }

     tube.drawInverse();
     
   }
   
   
  }else{
     
    textSize(38);
    text("GAME OVER",180,270);
    textSize(16);
    text("restart the program to try again",170,290);
   }
   
    // Add speed to location.
      y = y + speed;

  // Add gravity to speed.
     speed = speed + gravity;
     
    if (y > height-123) {
    // Multiplying by -0.40 instead of -1 slows the object 
    // down each time it bounces (by decreasing speed).  
    // This is known as a "dampening" effect and is a more 
    // realistic simulation of the real world (without it, 
    // a ball would bounce forever).
    speed = speed * -0.40;
    y = height-123;
  }
  
   bird.draw(img);
   
   for(Tube tube:tubeListTop){
            
        if(bird.onCollision(tube)&&!gameOver){
            gameOver = true;
               hit.play();
               delay(100);
               die.play();
           }
      
    }  
    
     for(Tube tube:tubeListBot){
            
        if(bird.onCollision(tube)&&!gameOver){
            gameOver = true;
               hit.play();
               delay(100);
               die.play();
           }
      
    }  

  }
  
void keyPressed(){
  
  img = img1;

  wing.play();
}
 
 
 
void keyReleased(){  
    y = y-30;
    speed = speed *0.05;
    img = img3;
  }
  