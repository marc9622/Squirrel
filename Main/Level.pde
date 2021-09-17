class Level {
  
  Runner runner = new Runner(this);
  Scoreboard scoreboard = new Scoreboard();
  PauseMenu pauseMenu = new PauseMenu();
  Background background = new Background();
  ObjectManager objectManager = new ObjectManager(this);
  boolean isPaused;
  float distance = 0;

  Level() {
    imageMode(CENTER);
    resizeWindow();
  }
  
  void resizeWindow() {
    if(width < 800) surface.setSize(800, height);
    if(height < 600) surface.setSize(width, 600);
    background.resizeImages();
  }
  
  void display() {
    if(isPaused) resizeWindow();
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
    if(isPaused) {
      unPause();
      return;
    }
    isPaused = true;
    surface.setResizable(true);
  }
  
  void unPause() {
    surface.setResizable(false);
    resizeWindow();
    isPaused = false;
  }
}
