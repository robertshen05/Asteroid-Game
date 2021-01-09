class UFO extends GameObject {

  PVector direction;
  int side;
  int shotTimer = 0;
  int threshhold = 100;

  UFO() {
    enemy = true;
    direction = new PVector(.10, 0);
    velocity = new PVector (0, 0);
    size = (20);
    lives = 1;
    side = (int) random (4);
    if (side == 0) {
      location = new PVector (0, (random(height)));
    } else if (side == 1) {
      location = new PVector (random(width), height);
    } else if (side == 2) {
      location = new PVector (width, (random(height)));
    } else if (side == 3) {
      location = new PVector ((random(width)), 0);
    }
  }

  void show() {
    println("yes");
    pushMatrix();
    stroke(255);
    fill(255, 0, 0);
    translate(location.x, location.y);
    rotate(direction.heading());
    rect (0, 0, 20, 20);
    popMatrix();
  }

  void act() {
    super.act();
    shotTimer++;



    if (shotTimer > threshhold) {
      Bullet B = new Bullet();
      B.velocity = (direction.copy());
      B.velocity.setMag(3);
      B.location = location.copy();
      myObjects.add(B);
      shotTimer = 0;
    }

    if (location.x < -25) {
      location.x = 825;
    }
    if (location.x > 825) {
      location.x = -25;
    }
    if (location.y < -25) {
      location.y = 825;
    }
    if (location.y > 825) {
      location.y = -25;
    }

    if (velocity.mag() > 8) {
      velocity.setMag(8);
    }
    float x = location.x-myShip.location.x;
    float y = location.y-myShip.location.y;

    direction.x = -x; 
    direction.y = -y; 

    if (side == 0) {
      velocity.x = 2;
      velocity.y = 0;
    } else if (side == 1) {
      velocity.x = 0;
      velocity.y = -2;
    } else if (side == 2) {
      velocity.x = -2;
      velocity.y = 0;
    } else if (side == 3) {
      velocity.x = 0;
      velocity.y = 2;
    }
  }
}
