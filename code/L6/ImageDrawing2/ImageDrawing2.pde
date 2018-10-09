PImage graffiti; // holder for our image

void setup()
{
  size(800, 300);
  // load up our image
  graffiti = loadImage("riot.jpg");
  
  // resize it: width will be 400, height will be proportional
  graffiti.resize(400, 0);
}

void draw()
{
  // if the mouse is within the left half of the screen
  if(mouseX < width/2) {
    background(255, 0, 0);
    image(graffiti, 400, 0);
  }
  // the mouse is on the right half of the screen
  else {
    background(0, 0, 0);
    image(graffiti, 0, 0);
  }
}