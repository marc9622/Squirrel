class Collectable extends LevelObject {
  
  boolean isCollected;
  
  Collectable(Level level) {
    super(level);
    loadImages();
    setPosition();
  }
  
  void loadImages() {
  }
  
  void display() {
    if(isCollected) return;
    super.display();
    if(isTouching())
      collect();
  }
  
  void collect() {
    isCollected = true;
  }
  
  void setPosition() {
  }
  
}
