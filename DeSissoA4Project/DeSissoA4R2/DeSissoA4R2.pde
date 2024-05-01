// Array that store team names, the season and the PPG of Kawhi
String[] teams;
String[] seasons;
int[] pointsPerGame;

// Variables that store max and min ppg by kawhi
int maxPPG, minPPG;

//Setting up other graph values
int rectWidth;
int xOffset = 150;
int yOffset = 150;
int graphWidth = 700;
int graphHeight = 700;

// Uploading Fonts for my text
PFont boFont;

// For my image of Kawhi Leonard at the top of the screen
PImage kawhiImage;

// Init table to hold data
Table table;


int hoveredIndex = -1;

//setting up function with setting up canvas size, 
// loading the image of kawhi and the custom font
void setup() {
  size(1000, 1000); 
  boFont = createFont("Boogaloo-Regular.ttf", 24); 
  kawhiImage = loadImage("kawhi_image.png"); 
  kawhiImage.resize(150, 150); // Resizing image to fit screen
  
  table = loadTable("kawhi_stats.csv", "header"); // Loading my kawhi CSV data from my CSV file
 //Getting the values from my CSV file to use and init.' ing arrays for the data 
  int rowCount = table.getRowCount(); 
  teams = new String[rowCount]; 
  seasons = new String[rowCount]; 
  pointsPerGame = new int[rowCount]; 
  
  // Putting the data from my table onto the arrays
  for (int i = 0; i < rowCount; i++) {
    TableRow row = table.getRow(i);
    teams[i] = row.getString("Team");
    seasons[i] = row.getString("Season");
    float ppg = row.getFloat("PPG");
    pointsPerGame[i] = int(ppg);
  }
  
  
  maxPPG = max(pointsPerGame);
  minPPG = min(pointsPerGame);
  rectWidth = graphWidth / pointsPerGame.length; // Calculating width of each rectangle in the graph
}
//Drawing the background, displaying the graph, text, and image of kawhi
void draw() {
  background(255); 
  

  image(kawhiImage, width/2 - kawhiImage.width/2, yOffset - kawhiImage.height -10);
  
 
  Graph graph = new Graph(teams, seasons, pointsPerGame);
  graph.drawGraph();
  

  handleHoverEffect();
  

  strokeWeight(4);
  stroke(0);
  line(xOffset - 10, height - yOffset, xOffset + graphWidth + 10, height - yOffset); // X-axis
  line(xOffset, height - yOffset + 10, xOffset, height - yOffset - graphHeight - 10); // Y-axis
  

  textAlign(CENTER, TOP);
  fill(0);
  textFont(boFont);
  textSize(20);
  text("KAWHI LEONARD'S CAREER PPG", width / 2, yOffset / 2 + 30);
}

// Custom hovereffect function that checks what bar it is hovered over and displays the data
void handleHoverEffect() {
  for (int i = 0; i < pointsPerGame.length; i++) {
    float x = map(i, 0, pointsPerGame.length - 1, xOffset, xOffset + graphWidth);
    float h = map(pointsPerGame[i], minPPG, maxPPG, 0, graphHeight);
    
    
    if (mouseX > x && mouseX < x + rectWidth && 
        mouseY > height - yOffset - h && mouseY < height - yOffset) {
      hoveredIndex = i; 
      displayHoverInfo(i); 
      return;
    }
  }
  
  hoveredIndex = -1; 
}

// Function of the info that displays the info when you hover over a bar
void displayHoverInfo(int index) {
  String season = seasons[index];
  String team = teams[index];
  int ppg = pointsPerGame[index];
  
  
  fill(255, 220);
  rect(mouseX + 10, mouseY - 70, 200, 60);
  
  
  fill(0);
  textAlign(LEFT, TOP);
  textSize(14);
  text("Season: " + season, mouseX + 15, mouseY - 65);
  text("Team: " + team, mouseX + 15, mouseY - 45);
  text("PPG: " + ppg, mouseX + 15, mouseY - 25);
}

// Crating graph class and the constructor to init the graph data 
class Graph {
  String[] teams;
  String[] seasons;
  int[] data;
  
  
  Graph(String[] teams, String[] seasons, int[] data) {
    this.teams = teams;
    this.seasons = seasons;
    this.data = data;
  }
  
  // Drawing the graph on screen
  void drawGraph() {
    for (int i = 0; i < data.length; i++) {
      float x = map(i, 0, data.length - 1, xOffset, xOffset + graphWidth);
      float h = map(data[i], minPPG, maxPPG, 0, graphHeight);
      color teamColor = getColorForTeam(teams[i]);
      fill(teamColor);
      rect(x, height - yOffset - h, rectWidth, h); 
      textAlign(CENTER, BOTTOM);
      fill(0);
      text(data[i], x + rectWidth / 2, height - yOffset - h - 5); 
    }
    
    // Season label (rotated) Had to look up how to do push and pop properly
    //and also needed to look at code snippet to achieve this
    textAlign(CENTER, TOP);
    for (int i = 0; i < data.length; i++) {
      float x = map(i, 0, data.length - 1, xOffset, xOffset + graphWidth);
      float h = map(data[i], minPPG, maxPPG, 0, graphHeight);
      pushMatrix();
      translate(x + rectWidth / 2, height - yOffset + 15);
      rotate(-HALF_PI);
      text(seasons[i], -40, 0);
      popMatrix();
    }
  }
  
  // Change the bar color based off of that team kawhi was on at the time
  color getColorForTeam(String team) {
    color teamColor;
    switch (team) {
      case "Sen Antonio Spurs":
        teamColor = color(0);
        break;
      case "Toronto Raptors":
        teamColor = color(206, 17, 38);
        break;
      case "Los Angeles Clippers":
        teamColor = color(0, 102, 204);
        break;
      default:
        teamColor = color(0);
        break;
    }
    return teamColor;
  }
}
