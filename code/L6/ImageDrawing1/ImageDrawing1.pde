PImage cat; // PImage will hold our image

void setup()
{
  size(800, 600);
  // load in our image file: Processing will
  // look for this in the data folder
  cat = loadImage("kasper.jpg");
}

void draw()
{
  background(255);
  // draw the image at current mouseX, mouseY
  image(cat, mouseX, mouseY);
}