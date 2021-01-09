class Asteroid extends GameObject {

  Asteroid() {
    location = new PVector(random(800), random(800));
    velocity = new PVector(0, 1);
    velocity.rotate(random(TWO_PI));
    velocity.setMag(2);
    size = (50);
    lives = 1;
  }

  Asteroid(float s, float x, float y) {
    lives = 1;
    location = new PVector (x, y);
    velocity = new PVector (0, 1);
    velocity.rotate(random(TWO_PI));
    size = s;
  }

  void act() {
    super.act();
    println("?");
    int i = 0;   
    while (i < myObjects.size()) {
      GameObject obj = myObjects.get(i);

      if (obj instanceof Bullet && dist (location.x, location.y, obj.location.x, obj.location.y) <= size/2 + obj.size) {
        obj.lives = 0;
        lives = 0;
        myObjects.add(new Asteroid(size/2, location.x, location.y));
        myObjects.add(new Asteroid(size/2, location.x, location.y));
        if (size < 500) {
          int j = 0;
          while (j <40) {
            Particles a = (new Particles(location, new PVector(random(-1, 1), random(-1, 1))) );
            myObjects.add(a);
            j++;
          }
        }
      }
      i++;
    }

    println("?");
    if (location.x < -4) {
      location.x = 804;
    }
    if (location.x > 804) {
      location.x = -4;
    }
    if (location.y < -4) {
      location.y = 804;
    }
    if (location.y > 804) {
      location.y = -4;
    }


    println("?");
    if (size < 12.5) {
      lives = 0;
    }
  }
  void show() {
    strokeWeight(3);
    stroke(255);
    fill(0);
    ellipse(location.x, location.y, size, size);
  }
} 
