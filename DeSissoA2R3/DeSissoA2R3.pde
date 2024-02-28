void setup(){
  size(800,800);
}

void draw() 
{ 
  float mx = constrain(mouseX, 100, 680);
  float my = constrain(mouseY, 100, 680);
  
  background(0);
  stroke(255);
  noFill();
  square(100,100,600);
    
  noStroke();
  fill(190);
  ellipse(200,100, 150, 70);
  circle(250,100,70);
  fill(255);
  circle(275,85,20);
  circle(275,115,20);
  
  fill(0);
  circle(280,85,10);
  circle(280,115,10);
  

  fill(#FFCF0A);
  rect(mx, my, 20, 20);
}
