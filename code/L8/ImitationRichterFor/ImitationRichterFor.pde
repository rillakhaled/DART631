void setup()
{
  size(500,500);
  noStroke();
}

void draw()
{
  /* draw a white rectangle with quite a lot of transparency
  to cover the screen */
  fill(255, 5);
  rect(0, 0, width, height);

  /* until we run into the mouseX location, do the following
  and keep updating the val of currentLocation */
  for(int currentLocation = 0; currentLocation < mouseX; currentLocation+=20){

    // establish a mapped color

    // R: based on currentLocation
    // note: we need to cast into an int, because map returns a float
    int r = int(map(currentLocation, 0, width, 0, 255));

    // G: based on mouseY
    // note: we need to cast into an int, because map returns a float
    int g = int(map(mouseY, 0, height, 0, 255));

    // B: based on how many frames have elapsed
    // note: we need to cast into an int, because map returns a float
    int b = int(map(frameCount % 300, 0, 300, 0, 255));

    fill(r, g, b);

    // draw a rectangle at currentLocation, mouseY that is 10x10
    rect(currentLocation, mouseY, 10, 10);
  }
}
