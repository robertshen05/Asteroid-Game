class Particles extends GameObject {
  int i; 

  Particles() {
    lives = 1;
    location = new PVector();
    velocity = new PVector(0, 1);
    velocity.rotate(radians(4)+random(-.5, .5));
    velocity.setMag(.5);
  }

  Particles(PVector l, PVector v) {
    location = l.copy();
    velocity = v;
    i = 255;
    velocity.rotate(radians(4)+random(-.5, .5));
    lives = 1;
  }
  void show() {
    println("Error: Mode = " + mode); 
    noStroke();
    fill(255, 0, 0, i);
    circle(location.x, location.y, 10);
  }

  void act() {
    super.act();
    i = i - 5;
    if (i <= 0) {
      lives = 0;
    }
  }
}
