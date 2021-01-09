UFO u;
Spaceship myShip;
ArrayList<GameObject> myObjects;
ArrayList<GameObject> myParticles;
boolean wkey, akey, skey, dkey, spacekey;
int mode;
final int INTRO = 1;
final int GAME = 2;
final int GAMEOVER = 3;
final int PAUSE = 4;

void setup() {
  mode = INTRO;  
  size(800, 800);
  myShip = new Spaceship();
  myParticles = new ArrayList<GameObject>();
  rectMode(CENTER);
  wkey = akey = skey = dkey = spacekey = false;
  myObjects = new ArrayList<GameObject>();
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
  u = new UFO();
}

void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == GAMEOVER) {
    gameover();
  } else if (mode == PAUSE) {
    pause();
  } else {
    println("Error: Mode = " + mode);
  }
  
  
  
  
}
