class Coin extends LevelObject {
  
  int value;
  boolean isCollected;
  
  Coin(Level level) {
    super(level);
    size = new PVector(172, 171);
    images.add(loadImage("Assets/Coin1.png"));
    images.get(0).resize((int)size.x, (int)size.y);
    images.add(loadImage("Assets/Coin2.png"));
    images.get(1).resize((int)size.x, (int)size.y);
    images.add(loadImage("Assets/Coin3.png"));
    images.get(1).resize((int)size.x, (int)size.y);
    images.add(loadImage("Assets/Coin4.png"));
    images.get(1).resize((int)size.x, (int)size.y);
    images.add(loadImage("Assets/Coin5.png"));
    images.get(1).resize((int)size.x, (int)size.y);
    images.add(loadImage("Assets/Coin6.png"));
    images.get(1).resize((int)size.x, (int)size.y);
    setPosition();
  }
  
  void display() {
    if(isCollected)
      return;
    super.display();
    if(isTouching())
      collect();
  }
  
  void collect() {
    isCollected = true;
    level.scoreboard.score++;
  }
  
  void setPosition() {
    pos = new PVector(width + level.dis + size.x, random(200, height - 480));
  }
  
}
