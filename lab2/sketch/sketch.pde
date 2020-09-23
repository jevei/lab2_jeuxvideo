int currentTime;
int previousTime;
int deltaTime;

void setup () {
  currentTime = millis();
  previousTime = currentTime;
  
}

void draw () {
  currentTime = millis();
  deltaTime = currentTime - previousTime;
  previousTime = currentTime;
  
  update(deltaTime);
  display();
}

/***
  The calculations should go here
*/
void update(int delta) {
  
}

/***
  The rendering should go here
*/
void display () {
  
}

abstract class GraphicObject{
  PVector location = new PVector();
  PVector velocity = new PVector();
  PVector acceleration = new PVector();
  
  color fillColor;
  color strokeColor;
  float strokeWeight;
  
  abstract void update(int deltaTime);
  abstract void display();
}
