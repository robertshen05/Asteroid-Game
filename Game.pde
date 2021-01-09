void game() {
  background(0);
  myShip.show();
  myShip.act();
  fill(255);
  text("LIVES: "+myShip.lives, 700, 50);

  //println(myObjects.size());
  int i = 0; //start with object 0



  while ( i < myObjects.size() ) {
    //do smth with the current object
    GameObject obj = myObjects.get(i);
    if (obj.lives > 0) {
       println("...");
      obj.act();
      println("!");
      obj.show();
      println("?");
      i++; //go to the next object
    } else {
      myObjects.remove(i);
    }
  }
  if (myShip.lives <= 0) {
    mode = GAMEOVER;
  } 
  if (myObjects.size() == 0) {
    mode = GAMEOVER;
  }
  u.show();
  u.act();
} 

void gameClicks() {
  mode=PAUSE;
}
