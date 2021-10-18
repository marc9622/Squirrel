Level level1;

void setup() {
  size(800, 600);
  level1 = new Level(this);
}

void draw() {
  level1.display();
  resizeWindow();
}

void resizeWindow() {
  if(width < 800) surface.setSize(800, height);
  if(height < 600) surface.setSize(width, 600);
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

void mousePressed() {
  level1.pauseMenu.clicked(mouseX, mouseY);
}
