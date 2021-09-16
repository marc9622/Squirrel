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
  if(!isDead && !isPaused)
    level.runner.jumpPress();
}

void keyReleased() {
  if(!isDead && !isPaused)
    level.runner.jumpRelease();
}
