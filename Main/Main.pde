Level level1;

void setup() {
  level1 = new Level();
  size(1000, 750);
}


void draw() {
  level1.display();
}

void keyPressed() {
  if(key == ESC) {
    key = 0;
    level1.pause();
    return;
  }
  level1.runner.jumpPress();
}

void keyReleased() {
  level1.runner.jumpRelease();
}
