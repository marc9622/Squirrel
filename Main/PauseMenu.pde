class PauseMenu {
  
  boolean shouldDisplayScores;
  PImage pausePaused = loadImage("Assets/PauseMenu/Paused.png");
  PVector pausePausedSize = new PVector(318, 138);
  PImage pauseRestart = loadImage("Assets/PauseMenu/Restart.png");
  PVector pauseRestartSize = new PVector(211, 82);
  PImage pauseContinue = loadImage("Assets/PauseMenu/Continue.png");
  PVector pauseContinueSize = new PVector(211, 83);
  PImage deadGameOver = loadImage("Assets/GameOver/GameOver.png");
  PVector deadGameOverSize = new PVector(318, 138);
  PImage deadScore = loadImage("Assets/GameOver/Score.png");
  PVector deadScoreSize = new PVector(618, 82);
  PImage deadContinue = loadImage("Assets/GameOver/Continue.png");
  PVector deadContinueSize = new PVector(210, 82);
  PImage scoreHighScore1 = loadImage("Assets/Leaderboard/Highscore1.png");
  PVector scoreHighScore1Size = new PVector(568, 69);
  PImage scoreHighScore2 = loadImage("Assets/Leaderboard/Highscore2.png");
  PVector scoreHighScore2Size = new PVector(516, 68);
  PImage scoreHighScore3 = loadImage("Assets/Leaderboard/Highscore3.png");
  PVector scoreHighScore3Size = new PVector(471, 69);
  PImage scoreHighScore4 = loadImage("Assets/Leaderboard/Highscore4.png");
  PVector scoreHighScore4Size = new PVector(418, 68);
  PImage scoreHighScore5 = loadImage("Assets/Leaderboard/Highscore5.png");
  PVector scoreHighScore5Size = new PVector(380, 68);
  PImage scoreRestart = loadImage("Assets/Leaderboard/Restart.png");
  PVector scoreRestartSize = new PVector(211, 82);
  Level level;
  
  PauseMenu(Level level) {
    this.level = level;
  }
  
  void displayPaused() {
    imageMode(CENTER);
    image(pausePaused, width / 2, height / 3);
    image(pauseContinue, width / 2, height / 2 + 50);
    image(pauseRestart, width / 2, height / 3 * 2 + 50);
  }
  
  void displayDead() {
    imageMode(CENTER);
    if(shouldDisplayScores) {
      displayScores();
      return;
    }
    image(deadGameOver, width / 2, height / 3);
    image(deadScore, width / 2, height / 2 + 50);
    fill(255);
    textSize(50);
    textAlign(CENTER);
    text(level.scoreboard.score, width / 2, height / 2 + 68);
    image(deadContinue, width / 2, height / 3 * 2 + 50);
  }
  
  void displayScores() {
    image(scoreHighScore1, width / 2, height / 15 * 2);
    image(scoreHighScore2, width / 2, height / 15 * 4);
    image(scoreHighScore3, width / 2, height / 15 * 6);
    image(scoreHighScore4, width / 2, height / 15 * 8);
    image(scoreHighScore5, width / 2, height / 15 * 10);
    image(scoreRestart, width / 2, height / 15 * 12);
  }
  
  void clicked(float x, float y) {
    if(level.isPaused) {
      if(x < width / 2 + pauseContinueSize.x / 2 &&
         x > width / 2 - pauseContinueSize.x / 2 &&
         y < height / 2 + 50 + pauseContinueSize.y / 2 &&
         y > height / 2 + 50 - pauseContinueSize.y / 2)
        level.unPause();
      else
      if(x < width / 2 + pauseRestartSize.x / 2 &&
         x > width / 2 - pauseRestartSize.x / 2 &&
         y < height / 3 * 2 + 50 + pauseRestartSize.y / 2 &&
         y > height / 3 * 2 + 50 - pauseRestartSize.y / 2)
        setup();
    }
    if(level.runner.isDead) {
      if(shouldDisplayScores) {
        if(x < width / 2 + scoreRestartSize.x / 2 &&
           x > width / 2 - scoreRestartSize.x / 2 &&
           y < height / 15 * 12 + scoreRestartSize.y / 2 &&
           y > height / 15 * 12 - scoreRestartSize.y / 2)
          setup();
      }
      else {
        if(x < width / 2 + deadContinueSize.x / 2 &&
           x > width / 2 - deadContinueSize.x / 2 &&
           y < height / 3 * 2 + 50 + deadContinueSize.y / 2 &&
           y > height / 3 * 2 + 50 - deadContinueSize.y / 2)
          shouldDisplayScores = true;
      }
    }
  }
}
