Level level;
boolean isPaused, isDead;

void setup() {
  level = new Level();
  size(1000, 750);
  rectMode(CENTER);
  imageMode(CENTER);
}


void draw() {
  level.display();
}

void showScore() {
  
}

void pause() {
  if(isPaused) {
    unPause();
    return;
  }
  isPaused = true;
  surface.setResizable(true);
}

void unPause() {
  surface.setResizable(false);
  level.resizeImages();
  isPaused = false;
}

void keyPressed() {
  if(key == ESC) {
    key = 0;
    pause();
    return;
  }
  if(!isDead && !isPaused)
    level.runner.jumpPress();
}

void keyReleased() {
  if(!isDead && !isPaused)
    level.runner.jumpRelease();
}
