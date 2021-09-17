class Runner {
  
  float pos;
  float vel;
  float acc;
  int size = 160;
  PImage running1Image = loadImage("Assets/Running1.png");
  PImage running2Image = loadImage("Assets/Running2.png");
  PImage jumpingImage = loadImage("Assets/Jumping.png");
  PImage glidingImage = loadImage("Assets/Gliding.png");
  PImage deadImage = loadImage("Assets/Dead.png");
  String imageState = "running1";
  float gravity = 1.8;
  float glideMaxSpeed = 2;
  boolean isOnGround = true, canDoubleJump = true;
  boolean isJumpPressed, isJumping;
  
  Runner() {
    pos = 950;
    running1Image.resize(size, size);
    running2Image.resize(size, size);
    jumpingImage.resize(size, size);
    glidingImage.resize((int)(size * 1.25), (int)(size * 1.25));
    deadImage.resize(size, (int)(size / 1.8));
  }
  
  void display() {
    switch(imageState) {
      case "running1":
        image(running1Image, 300, pos);
        if(shouldUpdateAnimation())
          imageState = "running2";
        break;
      case "running2":
        image(running2Image, 300, pos);
        if(shouldUpdateAnimation())
          imageState = "running1";
        break;
      case "jumping":
        image(jumpingImage, 300, pos);
        if(isOnGround)
          imageState = "running1";
        break;
      case "gliding":
        image(glidingImage, 300, pos);
        if(!isJumpPressed)
          imageState = "jumping";
        break;
      case "crouching1":
        break;
      case "crouching2":
        break;
      case "dead":
        image(deadImage, 315, pos + 30);
        break;
    }
    move();
  }
  
  boolean shouldUpdateAnimation() {
    if(frameCount % 6 == 0)
      return true;
    return false;
  }
  
  void move() {    
    pos += vel;
    vel += acc;
    acc = 0;
    gravity();
    glide();
  }
  
  void gravity() {
    if(pos > 950) {
      pos = 950;
      vel = 0;
      isOnGround = true;
      imageState = "running1";
    }
    if(pos < 950) {
      acc += gravity;
    }
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
    isJumpPressed = true;
    if(isJumping)
      return;
    if(isOnGround) {
      jump();
      isOnGround = false;
      isJumping = true;
      canDoubleJump = true;
    } else
    if(canDoubleJump) {
      jump();
      isJumping = true;
      canDoubleJump = false;
    }
  }
  
  void jumpRelease() {
    isJumpPressed = false;
    isJumping = false;
  }
  
  void checkCollision() {
    
  }
  
  void die() {
    isDead = true;
    imageState = "dead";
  }
  
}
