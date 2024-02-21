
  int yellow = #D8C300;
  int darkYellow = #D1B202;
  int purple = #BFAFD1;
  int blue = #0046D8;
  int gray = #D1D1D1;
  int green = #4FFF29;
      
void setup(){
   size(400, 400);
  }



 void draw(){
   background(255);
   
   noFill();
   stroke(0);
   rect(300,30, 80, 300, 10);
   
   noFill();
   stroke(0);
   rect(200,30, 80, 300, 10);
   
   noFill();
   stroke(0);
   rect(80,30, 80, 200, 10);
   
   noFill();
   stroke(0);
   rect(80,250, 80, 80, 10);
   
   stroke(darkYellow);
   fill(yellow);
   rect(350,30, 40, 300);
   
   stroke(darkYellow);
   fill(blue);
   rect(305,120, 80, 125);
   
   fill(darkYellow);
   text("C Building", 320, 187);

   stroke(darkYellow);
   fill(blue);
   rect(305,40, 70, 40);
   fill(blue);
   rect(345,80, 30, 40);
   
   fill(darkYellow);
   text("B Building", 315, 65);
   
   stroke(darkYellow);
   fill(blue);
   rect(270,165, 35, 10);
   
   stroke(darkYellow);
   fill(yellow);
   rect(210,40, 50, 30);
   
   fill(blue);
   text("Admin", 215, 55);
   text("Parking ", 215, 65);
   stroke(darkYellow);
   fill(blue);
   rect(210,70, 60, 75);
   
   stroke(darkYellow);
   fill(blue);
   rect(250,145, 20, 30);
  
   fill(darkYellow);
   text("A Building", 215, 110);
   
   stroke(darkYellow);
   fill(blue);
   rect(85,40, 65, 30);
  
   fill(darkYellow);
   text("D Building", 92, 57);
   
   
 
   
  
   
};
