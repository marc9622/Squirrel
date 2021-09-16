class Level {
  
  ArrayList<LevelObject> levelObjects = new ArrayList<LevelObject>();
  Runner runner = new Runner();
  Scoreboard scoreboard = new Scoreboard();
  float spd = 6;
  float dis = 0;
  float loopDisBg = 0;
  float loopDisTrees1 = 0;
  float loopDisTrees2 = 0;
  float loopDisGround = 0;
  PImage groundImage = loadImage("Assets/Ground.png");
  PImage trees1Image = loadImage("Assets/Trees1.png");
  PImage trees2Image = loadImage("Assets/Trees2.png");
  PImage bgImage = loadImage("Assets/Sky.png");
  
  Level() {
    groundImage.resize(height, height);
    trees1Image.resize(height, height);
    trees2Image.resize(height, height);
    bgImage.resize(height, height);
  }
  
  void display() {
    drawImage(bgImage, loopDisBg);
    drawImage(trees2Image, loopDisTrees2);
    drawImage(groundImage, loopDisGround);
    drawImage(trees1Image, loopDisTrees1);
    if(!isDead) move();
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
    dis += spd;
    if(loopDisBg >= height) loopDisBg -= height;
    else loopDisBg += spd / 10;
    if(loopDisTrees1 >= height) loopDisTrees1 -= height;
    else loopDisTrees1 += spd;
    if(loopDisTrees2 >= height) loopDisTrees2 -= height;
    else loopDisTrees2 += spd / 2;
    if(loopDisGround >= height) loopDisGround -= height;
    else loopDisGround += spd;
  }
  
  void manageObjects() {
    for(LevelObject object : levelObjects)
      if(object.pos.x + object.size.x - dis < 0) {
        levelObjects.remove(object);
        break;
      }
    for(LevelObject object : levelObjects)
      object.display();
    if(frameCount % 75 == 0)
      spawnObject();
    if(frameCount % 210 == 0)
      levelObjects.add(new Coin(this));
  }
  
  void spawnObject() {
    LevelObject object = getRandomObstacle();
    if(object != null)
      levelObjects.add(object);
  }
  
  LevelObject getRandomObstacle() {
    int rnd = (int)random(100);
    if(rnd <= 20)
      return new Obstacle(this, "Turtle");
    if(rnd <= 40)
      return new Obstacle(this, "Hedgehog");
    if(rnd <= 60)
      return new Obstacle(this, "Spikes");
    return null;
  }
}
