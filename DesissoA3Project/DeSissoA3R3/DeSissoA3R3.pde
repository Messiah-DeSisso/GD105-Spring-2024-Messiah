// Declaring variables for the rotation angle and its speed
float angle = 0;
float angleSpeed = 0.13; // Increases the angle speed, speeading up program

// Declaring variables that store the number of lines to draw and thier parameters
int numLines = 50;
float[] lineAngles;
float[] lineSpeeds;
float[] lineOffsets;

void setup() {
  // Seting up the canvas
  size(600, 600);
  
  // Init. arrays to store parameters of the lines
  lineAngles = new float[numLines];
  lineSpeeds = new float[numLines];
  lineOffsets = new float[numLines];
  
  //Random values for the angle speed and offset of the lines which creates this pattern
  for (int i = 0; i < numLines; i++) {
    lineAngles[i] = random(TWO_PI);
    lineSpeeds[i] = random(0.01, 0.05);
    lineOffsets[i] = random(TWO_PI);
  }
}

void draw() {
  background(0);
  
  // Origin @ the center of the screen
  translate(width/2, height/2);
  
  // Updating the rotation angle by adding the speed
  angle += angleSpeed;
  
  // Drawing rotating lines
  for (int i = 0; i < numLines; i++) {
    //this Calculates the rotation angle for each of the lines based off of its speed and the rotation angle
    float rotation = angle * lineSpeeds[i];
    
    // Calculate the coordinates of the line's endpoints and mapping the coordinates to colors(used tutorial for this, was extremely hard)
    float x1 = cos(rotation + lineOffsets[i]) * width/2;
    float y1 = sin(rotation + lineOffsets[i]) * height/2;
    float x2 = cos(rotation + lineOffsets[i] + PI) * width/2;
    float y2 = sin(rotation + lineOffsets[i] + PI) * height/2;
    
    float r = map(x1, -width/2, width/2, 0, 255);
    float g = map(y1, -height/2, height/2, 0, 255);
    float b = map(x2, -width/2, width/2, 0, 255);
    
    //Setting the color of the lines
    stroke(r, g, b);
    
    // Drawing the line
    line(x1, y1, x2, y2);
  }
}
