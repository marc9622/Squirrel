class ObjectManager {
  
  ArrayList<LevelObject> levelObjects = new ArrayList<LevelObject>();
  Level level;
  
  ObjectManager(Level level) {
    this.level = level;
  }
  
  void displayObjects() {
    for(LevelObject object : levelObjects) object.display();
  }
  
  void manageObjects() {
    for(LevelObject object : levelObjects)
      if(object.pos.x + object.size.x - level.distance < 0) {
        levelObjects.remove(object);
        break;
      }
    if(level.isPaused) return;
    if(frameCount % 75 == 0) spawnObject();
    if(frameCount % 210 == 0) levelObjects.add(new Coin(level));
    if(frameCount % 1090 == 0) levelObjects.add(new PowerUp(level));
  }
  
  void spawnObject() {
    LevelObject object = getRandomObstacle();
    if(object != null) levelObjects.add(object);
  }
  
  LevelObject getRandomObstacle() {
    int rnd = (int)random(100);
    if(rnd <= 20) return new Obstacle(level, "Turtle");
    if(rnd <= 40) return new Obstacle(level, "Hedgehog");
    if(rnd <= 60) return new Obstacle(level, "Spikes");
    return null;
  }
  
}
