// Declare variables to store images
PImage sneaks1, sneaks2, sneaks3, sneaks4, sneaks5, sneaks6;

void setup() {
  size(800, 600); 
  background(255); 
  
  
  sneaks1 = loadImage("sneaks2.jpg");
  sneaks2 = loadImage("sneaks3.jpg");
  sneaks3 = loadImage("images.jpg");
  
  sneaks4 = loadImage("gratis-png-mars-blackmon-camiseta-memphis-grizzlies-zapatillas-air-jordan-jordan-sneaker.png");
  sneaks5 = loadImage("sneaker.jpg");
  sneaks6 = loadImage("sneaks6.jpg");
  
  // Draw images on canvas
  image(sneaks1, -30, 0); 
  image(sneaks2, 240, 0);
  image(sneaks3, 500, 0); 
  sneaks4.resize(250,150);
  image(sneaks4, 0, 150); 
  sneaks5.resize(250,150);
  image(sneaks5, 250, 150);
  sneaks6.resize(250,150);
  image(sneaks6, 500, 150); 
}

void draw() {
  // You can add more elements or effects here if needed
}
