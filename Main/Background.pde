class Background {
  
  float loopDisBg = 0;
  float loopDisTrees1 = 0;
  float loopDisTrees2 = 0;
  float loopDisGround = 0;
  PImage groundImage = loadImage("Assets/Ground.png");
  PImage trees1Image = loadImage("Assets/Trees1.png");
  PImage trees2Image = loadImage("Assets/Trees2.png");
  PImage bgImage = loadImage("Assets/Sky.png");
  
  void display() {
    drawImage(bgImage, loopDisBg);
    drawImage(trees2Image, loopDisTrees2);
    drawImage(groundImage, loopDisGround);
    drawImage(trees1Image, loopDisTrees1);
  }
  
  void drawImage(PImage image, float loopDis) {
    image(image, (int)(height/2 - loopDis), height/2);
    image(image, (int)(height/2 + height - loopDis) - 1, height/2);
    image(image, (int)(height/2 + 2*height - loopDis) - 2, height/2);
  }
  
  void move(float speed) {
    loopDisBg += speed / 10;
    loopDisTrees1 += speed;
    loopDisTrees2 += speed / 2;
    loopDisGround += speed;
    if(loopDisBg >= height) loopDisBg -= height;
    if(loopDisTrees1 >= height) loopDisTrees1 -= height;
    if(loopDisTrees2 >= height) loopDisTrees2 -= height;
    if(loopDisGround >= height) loopDisGround -= height;
  }
  
  void resizeImages() {
    groundImage.resize(height, height);
    trees1Image.resize(height, height);
    trees2Image.resize(height, height);
    bgImage.resize(height, height);
  }
}
