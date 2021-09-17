class PowerUp extends Collectable {
  
  float powerUpTime = 10;
  
  PowerUp(Level level) {
    super(level);
  }
  
  void loadImages() {
    size = new PVector(172, 171);
    images.add(loadImage("Assets/PowerUp1.png"));
    images.get(0).resize((int)size.x, (int)size.y);
    images.add(loadImage("Assets/PowerUp2.png"));
    images.get(1).resize((int)size.x, (int)size.y);
    images.add(loadImage("Assets/PowerUp3.png"));
    images.get(2).resize((int)size.x, (int)size.y);
    images.add(loadImage("Assets/PowerUp4.png"));
    images.get(3).resize((int)size.x, (int)size.y);
  }
  
  void collect() {
    super.collect();
    level.runner.gainPowerUp(powerUpTime);
  }
  
  void setPosition() {
    pos = new PVector(width + level.distance + size.x, random(100, height - 150));
  }
  
}
