void pause () {
  background(120);
  fill(255);
  textSize(26);
  textAlign(CENTER);
  text("GAME PAUSED", height/2, width/2);
  textSize(13);
  text("click anywhere to continue", height/2, 450);
}

void pauseClicks () {
  mode = GAME;
}
