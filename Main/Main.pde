Level level;
boolean isPaused, isDead;

void setup() {
  level = new Level();
  fullScreen();
  rectMode(CENTER);
  imageMode(CENTER);
}


void draw() {
  clear();
  level.display();
}

void showScore() {
  
}

void pause() {
  
}

void keyPressed() {
  level.runner.jumpPress();
}

void keyReleased() {
  level.runner.jumpRelease();
}
