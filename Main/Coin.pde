class Coin extends Collectable {
  
  int value;
  
  Coin(Level level) {
    super(level);
  }
  
  void loadImages() {
    size = new PVector(172, 171);
    images.add(loadImage("Assets/Coin1.png"));
    images.get(0).resize((int)size.x, (int)size.y);
    images.add(loadImage("Assets/Coin2.png"));
    images.get(1).resize((int)size.x, (int)size.y);
    images.add(loadImage("Assets/Coin3.png"));
    images.get(2).resize((int)size.x, (int)size.y);
    images.add(loadImage("Assets/Coin4.png"));
    images.get(3).resize((int)size.x, (int)size.y);
    images.add(loadImage("Assets/Coin5.png"));
    images.get(4).resize((int)size.x, (int)size.y);
    images.add(loadImage("Assets/Coin6.png"));
    images.get(5).resize((int)size.x, (int)size.y);
  }
  
  void collect() {
    super.collect();
    level.scoreboard.score++;
  }
  
  void setPosition() {
    pos = new PVector(width + level.distance + size.x, random(200, height - 480));
  }
  
}
