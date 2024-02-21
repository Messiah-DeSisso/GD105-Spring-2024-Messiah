int blue = #0000FF;


void setup(){
  // TODO: set the canvas size to something nice and big,
  // but smaller than your screen
    size(800,800);
    

  // if there are any text styles we want
  // to set that won't change, do that here
  
  // if you are using a font, load your .vlw into memory
  // and then set the current font style
}

// the draw function runs every frame, over and over
// any code we have in here will run multiple times
void draw(){
  // TODO: paint the background a solid color
    background(0);
    
   
    
    
  
    translate(-80, 120);
    textSize(70);
    textAlign(CENTER);
    rotate(-.3);
    fill(255);
    text("TSU SURF", 400, 200);
    
    fill(blue);
    rect(265, 215, 260, 100);
    fill(255);
    textSize(100);
    textAlign(CENTER);
    text("BARS", 400, 300);
    

    
    fill(blue);
    rect(265, 415, 260, 100);
    
    textAlign(CENTER);
    fill(255);
    text("I-95", 400, 500);
    
    textSize(70);
    textAlign(CENTER);
    fill(255);
    textSize(60);
    text("FREESTYLE", 400, 580);
  
    fill(255);
    rect(350, 305, 250, 120);
    textSize(100);
    textAlign(CENTER);
    fill(0);
    text("ON", 475, 400);
    
}
