class LevelObject {
  
  PVector pos = new PVector();
  PVector size = new PVector();
  ArrayList<PImage> images = new ArrayList<PImage>();
  int currentImage;
  PImage triggerImage;
  Level level;
  
  LevelObject(Level level) {
    this.level = level;
  }
  
  void display() {
    image(images.get(currentImage), pos.x - level.dis, pos.y);
  }
  
  boolean isTouching() {
    
    return false;
  }
  
}
