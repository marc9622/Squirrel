class PauseMenu {
  
  boolean shouldDisplayScores;
  PImage pausePaused = loadImage("Assets/PauseMenu/Paused.png");
  PImage pauseRestart = loadImage("Assets/PauseMenu/Restart.png");
  PImage pauseContinue = loadImage("Assets/PauseMenu/Continue.png");
  PImage deadGameOver = loadImage("Assets/GameOver/GameOver.png");
  PImage deadScore = loadImage("Assets/GameOver/Score.png");
  PImage deadContinue = loadImage("Assets/GameOver/Continue.png");
  PImage scoreHighScore1 = loadImage("Assets/Leaderboard/Highscore1.png");
  PImage scoreHighScore2 = loadImage("Assets/Leaderboard/Highscore2.png");
  PImage scoreHighScore3 = loadImage("Assets/Leaderboard/Highscore3.png");
  PImage scoreHighScore4 = loadImage("Assets/Leaderboard/Highscore4.png");
  PImage scoreHighScore5 = loadImage("Assets/Leaderboard/Highscore5.png");
  PImage scoreRestart = loadImage("Assets/Leaderboard/Restart.png");
  
  void displayPaused() {
    image(pausePaused, width / 2, height / 2);
  }
  
  void displayDead() {
    if(shouldDisplayScores) {
      displayScores();
      return;
    }
    image(deadGameOver, width / 2, height / 2);
  }
  
  void displayScores() {
    image(scoreRestart, width / 2, height / 2);
  }
}
