void setup() {
  smooth();
  //frameRate(20);
  size (800, 800);
  background(#7374A0);
}


void draw() {
  noStroke();
  fill(#7374A0);
  rectMode(CORNERS);
  rect(0, 0, displayWidth, displayHeight);
  translate(width/2, height/2);
  scale(1);
  weft();
}