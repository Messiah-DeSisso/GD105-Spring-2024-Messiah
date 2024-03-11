//Declaring my variables: Height of the ball, velocity of the ball, gravity of the ball
//and the position of the floor.
float ballHeight;
float v = 0;
float g = 0.2;
float posOfFloor;


//Setting up the scene, setting the ball height value 
//and the position of the floor value to use later
void setup() {
  size(400, 400);
  ballHeight = height / 2;
  posOfFloor = height - 50;

  
}

void draw() {
  //Drawing background
  background(#C9DAE0);
  //Drawing basketball rim
  noStroke();
  fill(255);
  rect(190,400,20,-250);
  noStroke();
  //Drawing the ground/floor position
  fill(#898989);
  rect(0,375,800,800);
  
  //Back to making rim
  stroke(#DB0202);
  strokeWeight(2);
  fill(255);
  rect(125,100, 150,100);
  noFill();
  stroke(#DB0202);
  strokeWeight(2);
  rect(170,135, 60,50);
  //Drawing the basketball
  stroke(0);
  fill(255, 165, 0);
  ellipse(width / 2, ballHeight, 50, 50);
  // Making the basketball position change/move
  v += g ;
  ballHeight += v;
  
  // Making the basketball bounce off the floor
  if (ballHeight >= posOfFloor) {
    ballHeight = posOfFloor;
    v *= -0.8; //Making it to when the ball bounces, it loses velocity until 
    // the basketball's height reaches the position of the floor
  }
  
  // Bouncing the basketball off boundary
  if (ballHeight <= 0) {
    ballHeight = 0;
    v *= -1;
  }
  // After everything, saving frames for creation of the GIF
  if (frameCount <= 120) {
    saveFrame("output/frame-####.png");
  }
}
