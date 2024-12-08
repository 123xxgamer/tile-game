Tile piece; //The tile to be moved around
int tileSize; //The size for new Tiles
int zoneSize; //The width of each color zone
int redZone; //The left x coordinate of the red zone
int greenZone; //The left x coordinate of the blue zone
int blueZone; //The left x coordinate of the green zone
int zoneTop; //The top edge of the color zone
int score; //The score
int timer; //Timer represents number of seconds remaining
boolean playing; //true or false depending on the state of the game


void setup() {
  size(600, 400);
  frameRate(60); 
  zoneSize = width/3;
  redZone = 0;
  zoneTop = 200;
  greenZone = zoneSize;
  blueZone = zoneSize * 2;

  reset();
}//setup

void draw() {
  background(255);
  drawBoard();

  piece.display();

  textSize(30);
  fill(0);
  textAlign(LEFT, TOP);
  text("Score: " + score, 0, 0);

  textAlign(RIGHT, TOP);

  if (playing) {
    text("Time remaining: "+timer+" s",width-20,20);
    if (frameCount%60==0) {
      timer--;
    }
    if (timer==0) {
      playing=false;
    }
  }
  else {
    text("Game over",width-100,20);
  }

}//draw

void reset() {
  timer = 5; //timer is set to 5 seconds
  playing = true; //game is active
  score = 0; //no score yet
  tileSize = 100; //initial tile size

  /* PART 0
    After completing the Tile class,
    write makeTile, defined below.
  */
  makeTile();
}//reset

void makeTile() {
  piece=new Tile(int(random(width-tileSize)),int(random(zoneTop-tileSize)),tileSize);
}//makeTile


void mousePressed() {
  if (playing) {
    piece.select(mouseX,mouseY);
  }
}//mousePressed


void mouseDragged() {
  if (playing) {
    piece.setXY(mouseX,mouseY);
  }
}//mouseDragged

void mouseReleased() {
  if (playing && piece.selected) {
    piece.selected=false;
    if (checkZone(mouseX,mouseY)) {
      score++;
      tileSize-=5;
      makeTile();
      timer=5;
    }
  }
}//mouseReleased

boolean checkZone(int x, int y) {
  if (y>zoneTop && ((piece._colr==0 && x<(greenZone-tileSize))||((piece._colr==1 && x<(blueZone-tileSize)))||((piece._colr==2 && x<(width-tileSize))))) {
    return true;
  }
  else {
    return false;
  }
}//checkZone

void drawBoard() {
  noStroke();
  fill(255, 0, 0);
  rect(redZone, zoneTop, zoneSize, height - zoneTop);
  fill(0, 255, 0);
  rect(greenZone, zoneTop, zoneSize, height - zoneTop);
  fill(0, 0, 255);
  rect(blueZone, zoneTop, zoneSize, height - zoneTop);
  stroke(0);
  strokeWeight(5);
  line(0, zoneTop, width, zoneTop);
}//drawBoard
