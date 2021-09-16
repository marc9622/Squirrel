class Obstacle extends LevelObject {
  
  PImage triggerImage;
  String type;
  
  Obstacle(Level level, String obstacleType) {
    super(level);
    type = obstacleType;
    setObstacleType();
    setPosition();
  }
  
  void setObstacleType() {
    switch(type) {
  case "turtle":
    size = new PVector(200, 200);
    images.add(loadImage("Assets/Turtle1.png"));
    images.get(0).resize((int)size.x, (int)size.y);
    images.add(loadImage("Assets/Turtle2.png"));
    images.get(1).resize((int)size.x, (int)size.y);
    break;
  case "tree trunk":
    // code block
    break;
  case "bush":
    // code block
    break;
}
  }
  
  void setPosition() {
    pos = new PVector(width + level.dis + size.x, 950);
  }
  
  boolean isTouching() {
    
    return false;
  }
  
}
