void gameover() {
  mode = GAMEOVER;
  if (myShip.lives <= 0) {
    background(120);
    fill(255);
    textSize(26);
    textAlign(CENTER);
    text("LOST :(", height/2, width/2);
  } else if (myObjects.size() == 0) {
    background(120);
    fill(255);
    textSize(26);
    textAlign(CENTER);
    text("WIN :D", height/2, width/2);
  }


  myObjects = new ArrayList<GameObject>();
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
  myParticles = new ArrayList<GameObject>();
  myShip = new Spaceship();
}

void gameoverClicks() {
  mode = INTRO;
}
