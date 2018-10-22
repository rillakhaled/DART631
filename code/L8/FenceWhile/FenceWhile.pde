int picketX = 0;
int picketWidth = 20;
int picketHeight = 100;
int picketRounding = 10;
PImage sky;
int skyLoc = -100;
int skyShift = 1;

void setup()
{
  size(1000, 400);
  background(200, 200, 255);
  sky = loadImage("sky.jpg");
}

void draw()
{
  // every 20 frames
  if (frameCount % 20 == 0) {
    // move the location of the sky background by 1 pixel
    skyLoc += skyShift;
    // reverse the direction of movement if we've hit 0 or -100
    if (skyLoc == 0 || skyLoc == -100) {
      skyShift *= -1;
    }
  }
  
  // draw the sky
  image(sky, skyLoc, 0);
  
  picketX = 0;
  
  // while picketX has not yet hit RHS of window
  while (picketX < width)
  {
    /* draw a rectangle of appropriate size - notice the 5th argument
    "picketRounding" lets us define a rectangle with a bevel */
    rect(picketX, 320, picketWidth, picketHeight, picketRounding); 
    
    // update the value of picketX to be higher
    picketX += picketWidth;
  }
}