/* This is a plan for making the second recipe for
// how to do everything here after watching those videos.
*/
 
// the setup function runs once at the beginning of the program
// any code we have in here will run once before anything else
  int yellow = #D8C700;
  int purple = #BFAFD1;
  int blue = #1E7BB7;
  int skyBlue = #48B7FF;
  int green = #4FFF29;
  
      
void setup(){

//  // TODO: set the canvas size to something nice and big,
//  // but smaller than your screen
   size(800, 325);

    
    
//  // optional: if we're going to be using a few specific colors
//  // we can save them to "color" variables to make switching easier...
  }


//// the draw function runs every frame, over and over
//// any code we have in here will run multiple times
 void draw(){
//  // TODO: paint the background a solid color
    background(#30839f);

//  // TODO: set the styles for the first shape
//  // potentially required: set the transforms for this shape
//  // then draw the first shape
    noStroke();
    fill(yellow);
    rect(100, 40, 600, 80);
    
    fill(skyBlue);
    rect(100, 120, 600, 5);
    
    fill(green);
    rect(100, 125, 600, 20);
    
    fill(purple);
    rect(100, 145, 600, 40);
    
    fill(green);
    rect(100, 185, 600, 20);
    
    fill(skyBlue);
    rect(100, 190, 600, 5);
    
    fill(yellow);
    rect(100, 195, 600, 80);
    
   
//  // repeat for the second shape, and so on.
//  // for optimization, draw similar styled shapes all at once
  
//  // save a copy of our canvas on the first frame so we have a clean .png
};
