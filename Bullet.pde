class Bullet extends GameObject {

  int timer;
  boolean enemy;
  //2. Constructor 
  Bullet() {
    enemy = false;
    timer = 120;
    location = new PVector(myShip.location.x, myShip.location.y);
    velocity = new PVector(myShip.direction.x, myShip.direction.y);
    velocity.setMag(8);
    size = (10);
    lives = 1;
  }

  //3. Behavior functions
  void show() {
    strokeWeight(3);
    stroke(255);
    fill(0);
    rect(location.x, location.y, size, size);
  }
  void act() { 
    super.act();

    timer--;
    if (timer == 0) {
      lives = 0;
    }
    if (location.x < -5) {
      lives = 0;
    }
    if (location.x > 805) {
      lives = 0;
    }
    if (location.y < -5) {
      lives = 0;
    }
    if (location.y > 805) {
      lives = 0;
    }
  }
}
