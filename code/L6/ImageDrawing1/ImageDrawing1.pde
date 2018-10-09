PImage cat;

void setup()
{
  size(800, 600);
  cat = loadImage("kasper.jpg");
}

void draw()
{
  int currentLocation = 0;

  while ( currentLocation < mouseX ) {
    image(cat, currentLocation, mouseY);
    //rect(currentLocation,mouseY,10,10);
    currentLocation += 200;
  }
}