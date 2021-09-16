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
  PImage groundImage;
  PImage trees1Image;
  PImage trees2Image;
  PImage bgImage;
  
  Level() {
    loadImages();
    levelObjects.add(new Obstacle(this, "turtle"));
  }
  
  void loadImages() {
    groundImage = loadImage("Assets/Ground.png");
    groundImage.resize(height, height);
    
    trees1Image = loadImage("Assets/Trees1.png");
    trees1Image.resize(height, height);
    
    trees2Image = loadImage("Assets/Trees2.png");
    trees2Image.resize(height, height);
    
    bgImage = loadImage("Assets/Sky.png");
    bgImage.resize(height, height);
    
    runner.running1Image = loadImage("Assets/Running1.png");
    runner.running1Image.resize(160, 160);
    
    runner.running2Image = loadImage("Assets/Running2.png");
    runner.running2Image.resize(160, 160);
    
    runner.jumpingImage = loadImage("Assets/Jumping.png");
    runner.jumpingImage.resize(160, 160);
    
    runner.glidingImage = loadImage("Assets/Gliding.png");
    runner.glidingImage.resize(200, 200);
  }  
  
  void display() {
    drawBackground();
    drawGround();
    drawTrees2();
    drawTrees1();
    if(!isDead) move();
    for(LevelObject object : levelObjects)
      object.display();
    runner.display();
  }
    
  void drawBackground() {
    fill(255);
    image(bgImage, (int)(height/2 - loopDisBg), height/2);
    image(bgImage, (int)(height/2 + height - loopDisBg) - 1, height/2);
    image(bgImage, (int)(height/2 + 2*height - loopDisBg) - 2, height/2);
  }
  
  void drawTrees1() {
    fill(255);
    image(trees1Image, (int)(height/2 - loopDisTrees1), height/2);
    image(trees1Image, (int)(height/2 + height - loopDisTrees1) - 1, height/2);
    image(trees1Image, (int)(height/2 + 2*height - loopDisTrees1) - 2, height/2);
  }
  
  void drawTrees2() {
    fill(255);
    image(trees2Image, (int)(height/2 - loopDisTrees2), height/2 - 100);
    image(trees2Image, (int)(height/2 + height - loopDisTrees2) - 1, height/2 - 100);
    image(trees2Image, (int)(height/2 + 2*height - loopDisTrees2) - 2, height/2 - 100);
  }
  
  void drawGround() {
    fill(255);
    image(groundImage, (int)(height/2 - loopDisGround), height/2);
    image(groundImage, (int)(height/2 + height - loopDisGround) - 1, height/2);
    image(groundImage, (int)(height/2 + 2*height - loopDisGround) - 2, height/2);
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
  
  void spawnObjects() {
    
  }
  
}
