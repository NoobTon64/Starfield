Particle[] bob = new Particle[200];

void setup(){
  size(900,900);
  noStroke();
  for(int i=0;i<bob.length;i++)
    bob[i] = new Particle();
  for(int i=0;i<3;i++)
    bob[i] = new oddParticle();
}

void draw()
{
  background(5,5,20);
  for(int i=0;i<bob.length;i++){
    bob[i].show();
    bob[i].move();
  }
}

class Particle
{
  double X,Y,speed,angle,mySize;
  int myColor,myOpacity;
  
  Particle(){ //Constructor
    X=Y=450;
    angle = Math.random()*2*Math.PI;
    speed = (Math.random()*10)+1;
    myColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));    
    myOpacity = 150;
    mySize = (int)(Math.random()*1);
  }  
  void move(){
    X = X+Math.cos(angle)*speed;
    Y = Y+Math.sin(angle)*speed;
    mySize+= 0.3;
    
    if(X<0 || X>900 || Y<0 || Y>900){
      X=Y = 450;
      mySize = 0;
      speed = (Math.random()*10)+1;
      myColor = color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256)); 
    }
  }
  
  void show(){
    fill(myColor,myOpacity);
    ellipse((float)X,(float)Y,(float)mySize,(float)mySize);
  }
}

class oddParticle extends Particle{
  oddParticle(){
    speed = 2;
    myOpacity = 255;
    mySize = 70;
  }
  void move(){
    X = X+Math.cos(angle)*speed;
    Y = Y+Math.sin(angle)*speed;
    if(X<0 || X>900)
      angle = Math.PI - angle;
    if(Y<0 || Y>900)
      angle = -angle;
  }
  void show(){
    // the planet
    noStroke();
    fill(230,140,60);
    ellipse((float)X,(float)Y,(float)mySize,(float)mySize);

    fill(190,100,40);
    ellipse((float)X-15,(float)Y+10,20,20);

    // the ring
    noFill();
    stroke(220,200,140);
    strokeWeight(5);
    ellipse((float)X,(float)Y,(float)mySize*1.8,(float)mySize/3);

    noStroke();

  }
}
