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
    if(shouldUpdateAnimation())
      if(currentImage + 1 >= images.size())
        currentImage = 0;
      else
        currentImage++;
  }
  
  boolean shouldUpdateAnimation() {
    if(frameCount % 6 == 0)
      return true;
    return false;
  }
  
  boolean isTouching() {
    float runnerSize = 0; //level.runner.size / 2;
    float sizeX = size.x / 2, sizeY = size.y / 2;
    float currentPosX = pos.x - level.dis;
    if(
      level.runner.pos + runnerSize > pos.y - sizeY &&
      level.runner.pos - runnerSize < pos.y + sizeY &&
      300 + runnerSize > currentPosX - sizeX &&
      300 - runnerSize < currentPosX + sizeX
      )
      return true;
    return false;
  }  
}
