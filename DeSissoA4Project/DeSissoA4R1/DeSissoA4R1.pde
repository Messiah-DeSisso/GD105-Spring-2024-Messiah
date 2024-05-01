// Declared the Array Lists to hold TextObject and Word objects
ArrayList<TextObject> texts; 
ArrayList<Word> wordBank; 

// Uploading overdrivefont and is in file manager 
PFont overdriveFont;

// My array of song lyrics from LIL HERB AKA G HERBO - FIGHT OR FLIGHT, word by word
String[] lyrics = {
  "I'm", "just", "giving", "you", "the", "real",
  "Cause", "I", "don't", "come", "from", "Hollywood", "or", "Beverly", "Hills",
  "I'm", "from", "where", "mothers", "don't", "care", "and", "babies", "get", "killed",
  "Where", "you", "gotta", "rob", "and", "go", "steal", "for", "stomachs", "to", "fill",
  "And", "it's", "hard", "for", "a", "young,", "black", "n****", "like", "myself",
  "Where", "the", "police", "compare", "oneself", "with", "everybody", "else",
  "So", "that", "means", "if", "you", "yourself", "they", "think", "you're", "everybody", "else"
};

// Arranging columns and rows for the text boxes on the page
int cols = 10; 
int boxWidth = 80; 
int boxHeight = 30;
int spacingX = 10; 
int spacingY = 30; 


//setup function - set canvas size, upload fonts and init. the array of text and word 
void setup() {
  size(1200, 1000); 
  overdriveFont = createFont("OverdriveSunset.otf", 20); 
  texts = new ArrayList<TextObject>(); 
  wordBank = new ArrayList<Word>();
  
  // using math to calcuate the width of the objects
  int totalWidth = cols * (boxWidth + spacingX) + spacingX;
  
  int xOffset = (width - totalWidth) / 2;
  int yOffset = spacingY + 100; 
  
  // Looping through the lyrics in order to get every word in the lyric to have its own box with the word up top
  for (String lyric : lyrics) {
    texts.add(new TextObject(lyric, xOffset, yOffset, boxWidth, boxHeight));
    xOffset += boxWidth + spacingX;
    // Found this help online to make it go to the next row when this one is filled!
    if (xOffset + boxWidth > width - spacingX) {
      xOffset = (width - totalWidth) / 2;
      yOffset += boxHeight + spacingY;
    }
  }
  
  // Making border for wordbank
  int bankWidth = totalWidth + 40; 
  int bankHeight = 150; 
  int bankX = (width - bankWidth) / 2;
  int bankY = height / 2 - bankHeight / 2 + 100; 
  
  // Creating a new instance for every lyric in lyrics
  for (int i = 0; i < lyrics.length; i++) {
    wordBank.add(new Word(lyrics[i], bankX + 30 + (i % cols) * (boxWidth + spacingX), bankY + 10 + (i / cols) * (boxHeight + spacingY)));
  }
}
//Draw function - background and custom font added with text
void draw() {  
  background(0);
  textFont(overdriveFont); 

  textSize(30); // setting text size
  textAlign(CENTER, TOP); // aligning text
  fill(255); // setting fill color to white
  text("Lil Herb - Fight or Flight", width/2, 50); // displaying title
  
  // Loop thru to display all text and word bank objects!
  for (TextObject text : texts) {
    text.display();
  }
  
  for (Word word : wordBank) {
    word.display();
  }
  
  // Making the boundary box
  stroke(255); 
  noFill();
  rect(115, 500, 1000, 450); 
}
//Using mouse pressed to check if a word is clicked in a word bank 
//and to move them in the word bank
void mousePressed() {
  boolean wordClicked = false; 
  for (Word word : wordBank) {
    if (word.contains(mouseX, mouseY)) {
      word.dragging = true; 
      word.offsetX = mouseX - word.x;
      word.offsetY = mouseY - word.y;
      wordClicked = true; 
      break; // using break to exit the loop after a word is clicked
    }
  }
 
  if (!wordClicked) {
    for (Word word : wordBank) {
      word.dragging = false; // setting dragging to false for all words if no word is clicked
    }
  }
}

void mouseReleased() {
  // Using this to reset the drag to false for all words after the mouse is released
  for (Word word : wordBank) {
    word.dragging = false;
  }
}

void mouseDragged() {
  // Updating positions of words, if the word is being dragged
  for (Word word : wordBank) {
    if (word.dragging) {
      word.x = mouseX - word.offsetX; 
      word.y = mouseY - word.offsetY; 
    }
  }
}

// Here is my text object class creation 
class TextObject {
  String text;
  float x, y;
  int w, h;
  
  // Constructor to initialize TextObject
  TextObject(String text, float x, float y, int w, int h) {
    this.text = text;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  // Method to display text object
  void display() {
    noFill(); // no fill for the rectangle
    stroke(255); // setting stroke color to white
    strokeWeight(2); // setting stroke weight
    
    // Drawing rectangle around text
    rect(x, y, w, h); 
    
    // Displaying text inside the rectangle
    textAlign(CENTER, BOTTOM); // aligning text
    textSize(16); // setting text size
    fill(255); // setting fill color to white
    // Adjusting text size and alignment for title
    if (text.equals("Lil Herb Fight or Flight")) {
      textSize(24); // adjusting text size for title
      textAlign(CENTER, CENTER); // aligning text for title
      text(text, width/2, y + h / 2); // displaying title
    } else {
      text(text, x + w / 2, y - 5); // displaying regular text
    }
  }
}

// Class for interactive word objects
class Word {
  String word;
  float x, y;
  boolean dragging;
  float offsetX, offsetY;
  
  // Constructor to initialize Word
  Word(String word, float x, float y) {
    this.word = word;
    this.x = x;
    this.y = y;
    this.dragging = false;
  }
  
  //Function to display word object
  void display() {
    textAlign(CENTER, CENTER);
    textSize(16); 
    fill(255); 
    text(word, x, y); 
  }
  
  // Method to see if a point is within the word's boundary box I created
 boolean contains(float px, float py) {
    float d = dist(px, py, x, y); 
    return (d < 15);
  }
}
