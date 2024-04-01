PFont myFont; // Declaring variables likes customs fonts,images, and the present date
PImage cloudySky; 
PImage prevArrow; 
PImage nextArrow; 
int presentMonth; // Variable to store the current month
int presentDay; // Variable to store the current day
int presentYear; // Variable to store the current year

void setup() {
  size(800, 600); // Setting up canvas
  myFont = createFont("gothicb.ttf", 50); // Loading custom font and setting it to the center 
  textFont(myFont);
  textAlign(CENTER, CENTER); 
  
  presentMonth = month(); // Gets the current month, day and year and stores it 
  presentDay = day(); 
  presentYear = year(); 
  
  // Loading all my images
  cloudySky = loadImage("cloudy_sky.jpg"); 
  prevArrow = loadImage("prev_arrow.png"); 
  nextArrow = loadImage("next_arrow.png"); 
  
  // Resize the arrows since they are two diff. sizes
  prevArrow.resize(50, 0); 
  nextArrow.resize(50, 0); 
}

void draw() {
  // Draw image background
  image(cloudySky, 0, 0, width, height);
  
  drawCalendar(); // Drawing the calendar
  drawArrows(); // Drawing the arrows
}

void drawCalendar() {
  fill(255); //drawing the text in the calendar
  textSize(48); 
  stroke(0); 
  strokeWeight(3); 
  String monthName; // Creating a variable to store the name of the month in
  int m = presentMonth; // Then, storing the current month in a variable
  if (m == 1) {
    monthName = "January";
  } else if (m == 2) {
    monthName = "February";
  } else if (m == 3) {
    monthName = "March";
  } else if (m == 4) {
    monthName = "April";
  } else if (m == 5) {
    monthName = "May";
  } else if (m == 6) {
    monthName = "June";
  } else if (m == 7) {
    monthName = "July";
  } else if (m == 8) {
    monthName = "August";
  } else if (m == 9) {
    monthName = "September";
  } else if (m == 10) {
    monthName = "October";
  } else if (m == 11) {
    monthName = "November";
  } else if (m == 12) {
    monthName = "December";
  } else {
    monthName = "Unknown";
  }
  String date = monthName + " " + presentDay + ", " + presentYear; 
  text("Today is: " + date, width/2, (height/2) - 50 ); // Displaying the current date
}

void drawArrows() {
  // Drawing previous/next day arrows
  image(prevArrow, 50, height - 90, 50, 50);
  
  image(nextArrow, width - 100, height - 90, 50, 50);
}

void mouseClicked() {
  // Checking for mouse click on prev day or next day arrows 
  if (mouseX > 50 && mouseX < 100 && mouseY > height - 90 && mouseY < height - 40) {
    prevDay();
  }
  
  
  if (mouseX > width - 100 && mouseX < width - 50 && mouseY > height - 90 && mouseY < height - 40) {
    nextDay();
  }
}

void prevDay() { // creating function for the prev day where after click the present
  presentDay--; // day text goes down by 1 day.
  if (presentDay < 1) {
    // Making cases for when its the end of the month to change the month and reset the days
    presentMonth--; 
    if (presentMonth < 1) {
      presentMonth = 12; 
      presentYear--; //makes it to where when the program hits the end of december it 
      //goes back to January 
    }
    presentDay = daysInMonth(presentYear, presentMonth); // Sets the current day to the last day of the previous month
  }
}
//next day does the opposite which increases days while still looping after december 
void nextDay() {
  presentDay++; 
  int daysInpresentMonth = daysInMonth(presentYear, presentMonth); 
  if (presentDay > daysInpresentMonth) {
    
    presentMonth++; 
    if (presentMonth > 12) {
      presentMonth = 1; 
      presentYear++; 
    }
    presentDay = 1; 
  }
}

//considers that months have different ending dates so creating different case statements for each month with leap years
int daysInMonth(int year, int month) {
  if (month == 2) {
    if (year % 4 == 0) {
      if (year % 100 == 0) {
        if (year % 400 == 0) {
          return 29; // Leap year
        } else {
          return 28; // Not a leap year
        }
      } else {
        return 29; // Leap year
      }
    } else {
      return 28; // Not a leap year
    }
  } else if (month == 4 || month == 6 || month == 9 || month == 11) {
    return 30; // April, June, September, November have 30 days
  } else {
    return 31; // All other months have 31 days
  }
}
