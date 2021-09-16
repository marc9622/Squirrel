class Scoreboard {
  
  int score;
  int[] highscores = new int[5];
  PImage signImage = loadImage("Assets/Sign.png");
  
  Scoreboard() {
    signImage.resize(193, 100);
  }
  
  void display() {
    image(signImage, 125, 75);
    fill(255);
    textSize(50);
    textAlign(CENTER);
    text(score, 122, 93);
  }
}
