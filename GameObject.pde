class GameObject {
  PVector location;
  PVector velocity;
  int lives;
  float size;
  boolean enemy;

  void show() {
    strokeWeight(3);
    stroke(255);
    fill(0);
    rect(location.x, location.y, size, size);
  }

  void act() {
    location.add(velocity);
  }
}
