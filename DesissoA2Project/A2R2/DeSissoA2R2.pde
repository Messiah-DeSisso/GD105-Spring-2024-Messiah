//Purple rain Image
PImage prain;
// Define how many drops of rain there will be, the position of the drops of rain and how fast the rain will fall
int dropsOfRain = 150;
//Initalizes an array of xPos and yPos for the drops of rain
float[] xPos = new float[dropsOfRain];
float[] yPos = new float[dropsOfRain];
float speedOfRain = 5;

void setup() {
  size(400, 400);
  // Using a for loop, creates the position for the rain drops for every drop of rain
  for (int i = 0; i < dropsOfRain; i++) {
    xPos[i] = random(width);
    yPos[i] = random(-height, 0);
  }
  background(0);
  prain = loadImage("prain.png");
}

void draw() {
  // Draws raindrops using a for loop statement 
  for (int i = 0; i < dropsOfRain; i++) {
    stroke(#5B00C4); 
    line(xPos[i], yPos[i], xPos[i], yPos[i] + 5); // Creates the raindrop shape for every run of the loop
    
    // Then, we start updating the raindrop's height
    yPos[i] += speedOfRain;
    
    // Ifthe raindrop goes beyond the bounds of the size, then we want to reset it
    if (yPos[i] > height) {
      yPos[i] = random(-height, 0);
      xPos[i] = random(width);
    }
  }
  //Add purple rain image
  prain.resize(200,200);
  image(prain, 100, 0);
}
