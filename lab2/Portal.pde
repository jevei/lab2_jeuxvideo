class Portal {
  // Liquid is a rectangle
  float x, y, w, h;
  // Coefficient of drag
  color c;
  
  Portal (float x_, float y_, float w_, float h_, color c_) {
    x = x_;
    y = y_;//300;
    w = w_;//1000;
    h = h_;//500; 
    c=c_;
  }  
  
  // Is the Mover in the Liquid?
  boolean contains(Boid b) {
    PVector l = b.position;
    if (l.x > x && l.x < x + w && l.y > y && l.y < y + h) {//fonctionne comme pour les rebord
      return true;
    } else {
      return false;
    }
  }
  
  boolean collision(Portal other){
    
    float minDistance = h + other.h; //<>//
    float distW=x-other.x; //<>//
    float distH=y-other.y; //<>//
    if(distW<0){
      distW*=-1; //<>//
    }
    if(distH<0){ //<>//
      distH*=-1;
    }
    if(distW<minDistance||distH<minDistance){
      return true;
    }else{
      return false;
    }
  }
  
  void display () {
    stroke (0);
    fill (c);
    
    //rect(x, y, w, h); //dimension eau
    ellipseMode(CORNER);
    ellipse(x,y,w,h);
  }

}
