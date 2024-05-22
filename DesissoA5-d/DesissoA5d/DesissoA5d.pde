import processing.sound.*; // importing the sound feature for processing

SoundFile[] songs = new SoundFile[3]; // making an array of 3 songs for the radio and setting the current index
int currentSongIndex = 0;

PImage radioOffImg, radioOnImg, sandImg, sunsetImg; // Setting up the custom images I used
boolean isPlaying = false; //Setting up other var values for the radio
boolean autoMode = false;
int displayMode = 0;
int lastInteractionTime;
int idleTime = 20000; // 20 seconds of idle time before song plays by itself

float sunRotation = 0; // Setting the sun's movement when the song plays
float sunPulse = 1;

void setup() { //Setup function
  size(800, 800);
  //loading songs and images
  songs[0] = new SoundFile(this, "180-audio.mp3");
  songs[1] = new SoundFile(this, "doowop.mp3");
  songs[2] = new SoundFile(this, "get-rich-snippet.mp3");

  radioOffImg = loadImage("radio-off.png");
  radioOnImg = loadImage("radio-on.png");
  sandImg = loadImage("sand.png");
  sunsetImg = loadImage("sunset.jpg");
  
  lastInteractionTime = millis();
}
//draw function
void draw() {
  //placing images
  image(sunsetImg, 0, 0, width, height);
  image(sandImg, 0, 120, width, sandImg.height);
  //creating animations for when the song is playing (used docs to learn how to animate with this math since this shit was confusing)
  if (isPlaying) {
    float offsetX = random(-2, 2);
    float offsetY = random(-2, 2);
    image(radioOnImg, width/2 - radioOnImg.width/2 + offsetX, height/2 - radioOnImg.height/2 + offsetY);
  
    sunPulse = 1 + sin(frameCount * 0.05) * 0.1;
    sunRotation += 0.01;
  //stopping song playing and animation
    if (!songs[currentSongIndex].isPlaying()) {
      if (isPlaying) {
        songs[currentSongIndex].stop();
      }
      currentSongIndex = (currentSongIndex + 1) % songs.length;
      songs[currentSongIndex].play();
    }
  } else {
    image(radioOffImg, width/2 - radioOffImg.width/2, height/2 - radioOffImg.height/2);
    sunPulse = 1;
    sunRotation = 0;
  }

  drawSun(width/2, height/4 - 70, 120, color(255, 255, 0));
//setting up the 20 second idle time that plays the song
  if (millis() - lastInteractionTime > idleTime) {
    if (!isPlaying) {
      songs[currentSongIndex].play();
      isPlaying = true;
    }
  }
}
//some more stuff I learned to do the sun animation
void drawSun(float x, float y, float radius, color c) {
  pushMatrix();
  translate(x, y);
  rotate(sunRotation);
  scale(sunPulse);
  noStroke();
  fill(c);
  ellipse(0, 0, radius * 2, radius * 2);
  popMatrix();
}
//Clicking the radio on and off and resetting the interaction time
void mousePressed() {
  if (isInsideImage(mouseX, mouseY, width/2, height/2, radioOffImg)) {
    if (!isPlaying) {
      songs[currentSongIndex].play();
    } else {
      songs[currentSongIndex].stop();
    }
    isPlaying = !isPlaying;
    lastInteractionTime = millis();
  }
}
//Setting up the different key pressed values in order to stop/start/skip song
void keyPressed() {
  if (key == ' ') {
    autoMode = !autoMode;
    if (autoMode && !isPlaying) {
      songs[currentSongIndex].play();
      isPlaying = true;
      lastInteractionTime = millis();
    }
  }
  
  if (key == 's' || key == 'S') {
    if (isPlaying) {
      while (songs[currentSongIndex].isPlaying()) {
        songs[currentSongIndex].stop();
      }
      isPlaying = false;
    }
  }
  
  if (key == 'n' || key == 'N') {
    if (isPlaying) {
      songs[currentSongIndex].stop();
      currentSongIndex = (currentSongIndex + 1) % songs.length;
      songs[currentSongIndex].play();
    }
  }
}
//only clicking inside img.
boolean isInsideImage(float x, float y, float cx, float cy, PImage img) {
  return x > cx - img.width/2 && x < cx + img.width/2 && y > cy - img.height/2 && y < cy + img.height/2;
}
