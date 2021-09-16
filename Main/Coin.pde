class Coin extends LevelObject {
  
  int value;
  
  Coin(Level level) {
    super(level);
  }
  
  boolean isTouching() {
    
    return false;
  }
  
}
