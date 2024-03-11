//Declaring the variables I need, which is just for the image I added.
PImage eas;

//Setting up a 800x800 etch-a-sketch scene with the Etch-a-sketch logo
void setup() {
  size(800, 800);
  background(#8B0114);
  eas = loadImage("EAS.png");
  fill(0);
  square(100,100,600);
  circle(550,750,80);
  circle(250,750,80);
  fill(#6A6A6A);
  circle(550,750,55);
  circle(250,750,55);
  fill(0);
  circle(550,750,20);
  circle(250,750,20);
}

void draw() {
  // creating an border/boundary for the skektch pad and adding the logo
  noFill();
  stroke(255);
  square(100,100,600);
  eas.resize(250,250);
  image(eas, 275,-70);
}

void mouseMoved() {
  // Setting the fill to the circles as a random rgb color
  float colorValue1 = random(0, 255);
  float colorValue2 = random(0, 255);
  float colorValue3 = random(0, 255);
  
  // Drawing circles at the position that the mouse is at
  fill(colorValue1,colorValue2, colorValue3);
  //Constraining the mouse to the square
  circle(constrain(mouseX, 100, 700), constrain(mouseY, 100, 700), 4);
}
