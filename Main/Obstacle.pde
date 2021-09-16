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
      case "Turtle":
        size = new PVector(212, 133);
        images.add(loadImage("Assets/Turtle1.png"));
        images.get(0).resize((int)size.x, (int)size.y);
        images.add(loadImage("Assets/Turtle2.png"));
        images.get(1).resize((int)size.x, (int)size.y);
        break;
      case "Hedgehog":
        size = new PVector(195, 153);
        images.add(loadImage("Assets/Hedgehog.png"));
        images.get(0).resize((int)size.x, (int)size.y);
        break;
      case "Spike":
        size = new PVector(195, 153);
        images.add(loadImage("Assets/Hedgehog.png"));
        images.get(0).resize((int)size.x, (int)size.y);
        break;
    }
  }
  
  void display() {
    super.display();
    if(isTouching())
      switch(type) {
        case "Turtle":
          level.runner.isOnGround = false;
          level.runner.canDoubleJump = true;
          level.runner.jump();
          break;
        case "Hedgehog":
          level.runner.die();
          break;
        case "Rope":
          level.runner.die();
          break;
      }
  }
  
  void setPosition() {
    pos = new PVector(width + level.dis + size.x, 950);
  }
  
}
