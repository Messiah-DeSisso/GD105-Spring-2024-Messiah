// Declaring global variables for the Apple logo image, a custom font, and the photo of lucy
PImage appleLogo;
PFont myFont;
PImage lucy;

void setup() {
  // Setting up the canvas size
  size(500, 500); 
  
  // Loading my custom font
  myFont = createFont("SFUIText-BoldItalicG3.otf", 30);
  textFont(myFont);
  

  
  // Loading my apple logo image and lucy
  appleLogo = loadImage("apple_logo.png");
  
  
  lucy = loadImage("cat.png"); // Load the cat photo
}

void draw() {
  // Setting the background color to black, and drawing the watch
  background(0);
  
  //Origin @ center of the canvas
  translate(width / 2, height / 2 - 50); 
  
  // Photo of lucy as the "watch face"
  image(lucy, -110, -140, 300, 300); 
  
  // creating a small function that I am calling here to create the heading/title of watch
  drawTitle();
  
  // function that draws the watches features
  drawWatchBackground();

  // Storing the current time in variables to use later.
  int hours = hour();
  int minutes = minute();
  int seconds = second();

  // Calculating the angles for the hour hand, minute, and second hands (needed docs for this)
  float hourAngle = map(hours % 12, 0, 12, 0, TWO_PI) - HALF_PI;
  float minuteAngle = map(minutes, 0, 60, 0, TWO_PI) - HALF_PI;
  float secondAngle = map(seconds, 0, 60, 0, TWO_PI) - HALF_PI;

  //Drawing the hands
  stroke(255, 0, 0); 
  strokeWeight(8); 
  line(0, 0, cos(hourAngle) * 70, sin(hourAngle) * 70); //(position of line angle based off time)


  stroke(0, 255, 0); 
  strokeWeight(5); 
  line(0, 0, cos(minuteAngle) * 100, sin(minuteAngle) * 100);//(position of line angle based off time)
  
  stroke(255); 
  strokeWeight(2); 
  float secLength = 120; 
  line(0, 0, cos(secondAngle) * secLength, sin(secondAngle) * secLength);
  
  // Function for the numbers inside the clock
  drawClockNumbers();
}

// Creating the function to draw title and place Apple logo
void drawTitle() {
  fill(255); 
  textAlign(CENTER, CENTER);
  
  // Apple logo
  image(appleLogo, -28, -195, 45, 45);
  
  // title text
  textSize(20);
  text("Messiah's Apple Watch", 0, -140); // Title text centered above the watch
}

// Creating a function to draw the Apple Watch background
void drawWatchBackground() {
  noFill();
  stroke(255); 
  strokeWeight(4); 
  rectMode(CENTER);
  rect(0, 0, 240, 240, 20); 
  
  // Draw straps on the sides of the square
  rect(-120, 0, 30, 200, 10); 
  rect(120, 0, 30, 200, 10);
}

// Creating clock numbers and indicators in the face of the watch
void drawClockNumbers() {
  textSize(20);
  fill(255); 
  textAlign(CENTER, CENTER);
  
  // Only looping through the numbers 1 - 12 and drawing them around the clock face
  for (int i = 1; i <= 12; i++) {
    float angle = map(i, 0, 12, -HALF_PI, TWO_PI - HALF_PI); 
    float x = cos(angle) * 90;
    float y = sin(angle) * 90;
    text(i, x, y); 
  }
}
