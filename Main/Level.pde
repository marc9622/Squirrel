class Level {
  
  ArrayList<LevelObject> levelObjects = new ArrayList<LevelObject>();
  Runner runner = new Runner();
  Scoreboard scoreboard = new Scoreboard();
  PauseMenu pauseMenu = new PauseMenu();
  float distance = 0;
  float loopDisBg = 0;
  float loopDisTrees1 = 0;
  float loopDisTrees2 = 0;
  float loopDisGround = 0;
  PImage groundImage = loadImage("Assets/Ground.png");
  PImage trees1Image = loadImage("Assets/Trees1.png");
  PImage trees2Image = loadImage("Assets/Trees2.png");
  PImage bgImage = loadImage("Assets/Sky.png");
  
  Level() {
    resizeWindow();
  }
  
  void resizeWindow() {
    if(width < 800) surface.setSize(800, height);
    if(height < 600) surface.setSize(width, 600);
    groundImage.resize(height, height);
    trees1Image.resize(height, height);
    trees2Image.resize(height, height);
    bgImage.resize(height, height);
  }
  
  void display() {
    if(isPaused) resizeWindow();
    drawImage(bgImage, loopDisBg);
    drawImage(trees2Image, loopDisTrees2);
    drawImage(groundImage, loopDisGround);
    drawImage(trees1Image, loopDisTrees1);
    if(isPaused) pauseMenu.display();
    else {
      runner.move();
      if(!isDead) move();
    }
    manageObjects();
    runner.display();
    scoreboard.display();
  }
  
  void drawImage(PImage image, float loopDis) {
    image(image, (int)(height/2 - loopDis), height/2);
    image(image, (int)(height/2 + height - loopDis) - 1, height/2);
    image(image, (int)(height/2 + 2*height - loopDis) - 2, height/2);
  }
  
  void move() {
    distance += runner.spd;
    loopDisBg += runner.spd / 10;
    loopDisTrees1 += runner.spd;
    loopDisTrees2 += runner.spd / 2;
    loopDisGround += runner.spd;
    if(loopDisBg >= height) loopDisBg -= height;
    if(loopDisTrees1 >= height) loopDisTrees1 -= height;
    if(loopDisTrees2 >= height) loopDisTrees2 -= height;
    if(loopDisGround >= height) loopDisGround -= height;
  }
  
  void manageObjects() {
    for(LevelObject object : levelObjects)
      if(object.pos.x + object.size.x - distance < 0) {
        levelObjects.remove(object);
        break;
      }
    for(LevelObject object : levelObjects) object.display();
    if(isPaused) return;
    if(frameCount % 75 == 0) spawnObject();
    if(frameCount % 210 == 0) levelObjects.add(new Coin(this));
    if(frameCount % 1090 == 0) levelObjects.add(new PowerUp(this));
  }
  
  void spawnObject() {
    LevelObject object = getRandomObstacle();
    if(object != null) levelObjects.add(object);
  }
  
  LevelObject getRandomObstacle() {
    int rnd = (int)random(100);
    if(rnd <= 20) return new Obstacle(this, "Turtle");
    if(rnd <= 40) return new Obstacle(this, "Hedgehog");
    if(rnd <= 60) return new Obstacle(this, "Spikes");
    return null;
  }
}
