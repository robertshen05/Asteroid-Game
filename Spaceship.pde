class Spaceship extends GameObject {
  //1.instant variables
  PVector direction;
  int shotTimer, threshhold;
  int invulnerable = 0;


  //2.constructors
  Spaceship() {
    location = new PVector(width/2, height/2);
    direction = new PVector(1, 0);
    velocity = new PVector(0, 0);  
    lives= 3;
    shotTimer = 0;
    threshhold = 40;
  }

  //3.behavior functions
  void show() {
    pushMatrix();
    stroke(255);
    if (invulnerable > 0) {
      fill (0, 0, 255);
    } else {
      fill (0);
    }
    translate(location.x, location.y);
    rotate(direction.heading());
    rect (0, 0, 50, 50);
    line(0, 0, 100, 0);
    popMatrix();
  }
  void act() {
    super.act();
    shotTimer++;

    if (akey) direction.rotate(-radians(4));
    if (dkey) direction.rotate(radians(4));
    if (wkey) velocity.add(direction);
    if (skey) velocity.sub(direction);
    if (spacekey && shotTimer > threshhold) {
      myObjects.add(new Bullet());
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

    if (velocity.mag() > 3) {
      velocity.setMag(3);
    }
    int i = 0;
    while (i < myObjects.size()) {

      if (invulnerable <= 0 && myObjects.get(i) instanceof Asteroid && dist (location.x, location.y, myObjects.get(i).location.x, myObjects.get(i).location.y) <= (size + myObjects.get(i).size)/2) {
        lives = lives - 1;
        invulnerable = 75;
      }
      i = i + 1;
    }
    if (enemy == true && invulnerable <= 0 && myObjects.get(i) instanceof UFO && dist (location.x, location.y, myObjects.get(i).location.x, myObjects.get(i).location.y) <= (size + myObjects.get(i).size)/2) {
      lives = lives - 1;
      invulnerable = 75;
    }
    
    
    
    if (invulnerable > 0) {
      invulnerable = invulnerable - 1;
    }
  }
}
