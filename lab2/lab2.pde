Flock flock;
Portal portal;
Portal portal2;

void setup() {
  size(1000, 800);
  portal = new Portal(random(100,900),random(100,700),50,50,color(0,0,255));
  portal2 = new Portal(random(100,900),random(100,700),50,50,color(255,0,0));
  flock = new Flock();
  // Add an initial set of boids into the system
  for (int i = 0; i < 150; i++) {
    Boid boid=new Boid(width/2,height/2);
    boid.fillColor = color(random(255), random(255), random(255));
    flock.addBoid(boid);
  }
}

void draw() {
  update();
  background(50);
  portal.display();
  portal2.display();
  flock.run();
}

// Add a new boid into the System
void mousePressed() {
  Boid boid=new Boid(mouseX,mouseY);
  boid.fillColor = color(random(255), random(255), random(255));
  flock.addBoid(boid);
}

void update() {
  if(portal.collision(portal2)){
    portal2 = new Portal(random(100,900),random(100,700),50,50,color(255,0,0)); //<>//
  }
  if (keyPressed) {
    if (key == ' '&&portal.h==0&&portal2.h==0) {
      portal = new Portal(random(100,900),random(100,700),50,50,color(0,0,255));
      portal2 = new Portal(random(100,900),random(100,700),50,50,color(255,0,0));
    }
    else if (key == ' '&&portal.h!=0&&portal2.h!=0) {
      portal=new Portal(0,0,0,0,0);
      portal2=new Portal(0,0,0,0,0);
    }
    else if(key=='r'||key=='R')
    {
      setup();
    }
  }
  for (int i = 0; i < flock.boids.size(); i++) {
    float tx;
    float ty;
    if (portal.contains(flock.boids.get(i))&&(flock.boids.get(i).p==1||flock.boids.get(i).p==0)) {
      tx=flock.boids.get(i).position.x-portal.x;
      ty=flock.boids.get(i).position.y-portal.y;
      flock.boids.get(i).position.x=portal2.x+portal2.w-tx;
      flock.boids.get(i).position.y=portal2.y+portal2.h-ty;
      flock.boids.get(i).p=1;
    }else if (portal2.contains(flock.boids.get(i))&&(flock.boids.get(i).p==2||flock.boids.get(i).p==0)) {
      tx=flock.boids.get(i).position.x-portal2.x;
      ty=flock.boids.get(i).position.y-portal2.y;
      flock.boids.get(i).position.x=portal.x+portal.w-tx;
      flock.boids.get(i).position.y=portal.y+portal.h-ty;
      flock.boids.get(i).p=2;
    }else if(!portal.contains(flock.boids.get(i))&&(flock.boids.get(i).p==1||flock.boids.get(i).p==2)){
      flock.boids.get(i).p=0;
    }
  }
}
