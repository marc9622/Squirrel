class Obstacle extends LevelObject {
  
  PImage triggerImage;
  String type;
  
  Obstacle(Level level, String obstacleType) {
    super(level);
    type = obstacleType;
    setObstacleType();
    setPositionX();
  }
  
  void setObstacleType() {
    switch(type) {
      case "Turtle":
        size = new PVector(212, 133);
        images.add(loadImage("Assets/Turtle1.png"));
        images.get(0).resize((int)size.x, (int)size.y);
        images.add(loadImage("Assets/Turtle2.png"));
        images.get(1).resize((int)size.x, (int)size.y);
        pos.y = 950;
        break;
      case "Hedgehog":
        size = new PVector(195, 153);
        images.add(loadImage("Assets/Hedgehog.png"));
        images.get(0).resize((int)size.x, (int)size.y);
        pos.y = 950;
        break;
      case "Spikes":
        size = new PVector(276, 438);
        images.add(loadImage("Assets/Spikes.png"));
        images.get(0).resize((int)size.x, (int)size.y);
        pos.y = 800;
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
        case "Spikes":
          level.runner.die();
          break;
      }
  }
  
  void setPositionX() {
    pos.x = width + level.dis + size.x;
  }
  
}
