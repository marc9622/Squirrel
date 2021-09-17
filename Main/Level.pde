class Level {
  
  Runner runner = new Runner(this);
  ScoreManager scoreboard = new ScoreManager();
  PauseMenu pauseMenu = new PauseMenu(this);
  Background background = new Background();
  ObjectManager objectManager = new ObjectManager(this);
  boolean isPaused;
  float distance = 0;

  Level() {
    background.resizeImages();
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
  }
  
  void unPause() {
    surface.setResizable(false);
    background.resizeImages();
    isPaused = false;
  }
}
