class Level {
  
  Runner runner = new Runner(this);
  ScoreManager scoreboard;
  PauseMenu pauseMenu = new PauseMenu(this);
  Background background = new Background();
  ObjectManager objectManager = new ObjectManager(this);
  boolean isPaused;
  float distance = 0;
  PImage icon = loadImage("Assets/Running1.png");

  Level(PApplet pApplet) {
    scoreboard = new ScoreManager(pApplet);
    setWindow();
  }
  
  void setWindow() {
    background.resizeImages();
    surface.hideCursor();
    surface.setTitle("Squirrel Game");
    surface.setIcon(icon);
  }
  
  void display() {
    if(isPaused) {
      background.resizeImages();
    }
    background.display();
    if(!isPaused && !runner.isDead) {
      runner.move();
      move();
    }
    objectManager.displayObjects();
    objectManager.manageObjects();
    runner.display();
    scoreboard.display();
    if(isPaused) pauseMenu.displayPaused();
    if(runner.isDead) pauseMenu.displayDead();
  }
  
  void move() {
    distance += runner.spd;
    background.move(runner.spd);
  }
  
  void pause() {
    if(runner.isDead)
      return;
    if(isPaused) {
      unPause();
      return;
    }
    isPaused = true;
    surface.setResizable(true);
    surface.showCursor();
  }
  
  void unPause() {
    surface.setResizable(false);
    surface.showCursor();
    background.resizeImages();
    isPaused = false;
  }
  
  void die() {
    scoreboard.highscoreUpdaterThread.start();
    surface.setResizable(true);
    surface.showCursor();
  }
}
