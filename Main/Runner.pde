class Runner {
  
  float spd = 6;
  float pos;
  float vel;
  float acc;
  int size = 160;
  PImage running1Image = loadImage("Assets/Running1.png");
  PImage running2Image = loadImage("Assets/Running2.png");
  PImage jumpingImage = loadImage("Assets/Jumping.png");
  PImage glidingImage = loadImage("Assets/Gliding.png");
  PImage powerUpImage = loadImage("Assets/PowerUp.png");
  PImage deadImage = loadImage("Assets/Dead.png");
  String imageState = "running1";
  float gravity = 1.8;
  float groundPos = height - 130;
  float glideMaxSpeed = 2;
  float powerFlyingSpeed = 10;
  boolean isOnGround = true, canDoubleJump = true;
  boolean isJumpPressed, isJumping;
  boolean hasPowerUp;
  boolean isDead;
  float powerUpTime;
  Level level;
  
  Runner(Level level) {
    this.level = level;
    pos = 950;
    running1Image.resize(size, size);
    running2Image.resize(size, size);
    jumpingImage.resize(size, size);
    glidingImage.resize((int)(size * 1.25), (int)(size * 1.25));
    deadImage.resize(size, (int)(size / 1.8));
    powerUpImage.resize((int)(size * 1.34), (int)(size / 1.34));
  }
  
  void display() {
    imageMode(CENTER);
    switch(imageState) {
      case "running1":
        image(running1Image, 300, pos);
        if(shouldUpdateAnimation()) imageState = "running2";
        break;
      case "running2":
        image(running2Image, 300, pos);
        if(shouldUpdateAnimation()) imageState = "running1";
        break;
      case "jumping":
        image(jumpingImage, 300, pos);
        if(isOnGround) imageState = "running1";
        break;
      case "gliding":
        image(glidingImage, 300, pos);
        if(!isJumpPressed) imageState = "jumping";
        break;
      case "crouching1":
        break;
      case "crouching2":
        break;
      case "powerUp":
        image(powerUpImage, 300, pos);
        break;
      case "dead":
        image(deadImage, 315, pos + 30);
        break;
    }
  }
  
  boolean shouldUpdateAnimation() {
    if(!level.isPaused && frameCount % 6 == 0) return true;
    return false;
  }
  
  void move() {
    groundPos = height - 130;
    endPowerUp();
    pos += vel;
    vel += acc;
    acc = 0;
    if(hasPowerUp) {
      if(isJumpPressed) vel = -powerFlyingSpeed;
      else vel = powerFlyingSpeed;
      if(isUnderGround()) pos = groundPos;
      return;
    }
    gravity();
    glide();
  }
  
  void gravity() {
    if(isUnderGround()) {
      pos = groundPos;
      vel = 0;
      isOnGround = true;
      imageState = "running1";
    }
    else if(pos < groundPos) acc += gravity;
  }
  
  boolean isUnderGround() {
    return pos > groundPos;
  }
    
  void jump() {
    vel = -35;
    imageState = "jumping";
  }
  
  void glide() {
    if(!isDead && isJumpPressed && vel > glideMaxSpeed) {
      vel = glideMaxSpeed;
      imageState = "gliding";
    }
  }
  
  void jumpPress() {
    if(isDead || level.isPaused) return;
    isJumpPressed = true;
    if(isJumping || hasPowerUp) return;
    if(isOnGround) {
      jump();
      isOnGround = false;
      isJumping = true;
      canDoubleJump = true;
    }
    else if(canDoubleJump) {
      jump();
      isJumping = true;
      canDoubleJump = false;
    }
  }
  
  void jumpRelease() {
    if(isDead || level.isPaused) return;
    isJumpPressed = false;
    isJumping = false;
  }
  
  void gainPowerUp(float time) {
    hasPowerUp = true;
    imageState = "powerUp";
    spd = 10;
    powerUpTime = time * 1000 + millis();
  }
  
  void endPowerUp() {
    if(hasPowerUp && millis() > powerUpTime) {
      hasPowerUp = false;
      imageState = "running1";
      spd = 6;
    }
  }
  
  void die() {
    if(isDead)
      return;
    level.die();
    isDead = true;
    imageState = "dead";
  }
}
