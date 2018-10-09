PImage graffiti;

void setup()
{
  size(800, 300);
  graffiti = loadImage("riot.jpg");
  graffiti.resize(400, 0);
}

void draw()
{
  if(mouseX < width/2) {
    background(255, 0, 0);
    image(graffiti, 400, 0);
  }
  else {
    background(0, 0, 0);
    image(graffiti, 0, 0);
  }
}