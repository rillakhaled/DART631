int alphaIn = 255;

void fadeIn() {
  rectMode(CENTER);
  fill(0, alphaIn);
  rect(0, 0, 3000, 3000);
  alphaIn--;
}

int alphaOut = 0;

void fadeOut() {
  rectMode(CENTER);
  fill(0, alphaOut);
  rect(0, 0, 3000, 3000);
  alphaOut++;
}