PImage img1;
PImage img2;
PImage img3;

void setup() {
  size(800, 800);
  
  img1 = loadImage("sneaker1.jpg");
  img2 = loadImage("sneaker2.jpg");
  img3 = loadImage("sneaker3.jpg");
}

void draw() {
  background(255);
  image(img1, 0, 0, width/3, height/3);
  image(img2, width/3, 0, width/3, height/3);
  image(img3, 2*width/3, 0, width/3, height/3);
}
