// Declare variables to store position and size
float circleX;
float circleY;
float circleSize;

void setup() {
  size(800, 600); 
  background(255); 
  

  circleX = width / 2; 
  circleY = height / 2;
  circleSize = 10; 
}

void draw() {

  ellipse(circleX, circleY, circleSize, circleSize);
  

  circleX += random(-5, 5); 
  circleY += random(-5, 5); 
  circleSize += random(-2, 2); 
  
  
  circleX = constrain(circleX, 0, width);
  circleY = constrain(circleY, 0, height);
  

  circleSize = constrain(circleSize, 5, 50);
}
