//Declaring vars for 9 images
PImage img1, img2, img3, img4, img5, img6, img7, img8, img9;
//Making background able to change from black to white on click
boolean blackBG = true;

void setup() {
  //setting up size
  size(800, 600);
  
  //Since im using 9 images in my collage, I used 9 load images
  img1 = loadImage("Image1.png");
  img2 = loadImage("SOL.png");
  img3 = loadImage("Messiah.png");
  img4 = loadImage("lion.png");
  img5 = loadImage("RileyNB.png");
  img6 = loadImage("fitted.png");
  img7 = loadImage("Crown.png");
  img8 = loadImage("Bronx.png");
  img9 = loadImage("AJ1.png");
}

void draw() {
  //using if statement to change BG color
  if (blackBG) {
    background(0); 
  } else {
    background(255); 
  }
  
//Resizing and placing images
  img4.resize(500,500);
  image(img4,0,120);
  img5.resize(500,500);
  image(img5, 150, 100);
   img6.resize(700,600);
  image(img6, 60, -130); 
  img2.resize(500,500);
  image(img2, 450, 110);
  img1.resize(300,300);
  image(img1, 520, 380);
  img3.resize(400,400);
  image(img3, 230, -150); 
  img7.resize(300,300);
  image(img7, 0, -90); 
  img8.resize(300,300);
  image(img8, 250, 355); 
  img9.resize(300,300);
  image(img9, -30, 370);
}
//using mousePressed function to change BG color
void mousePressed() {
  blackBG = !blackBG; 
}
