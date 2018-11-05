PImage morning; //PImage holder for morning
PImage day; //PImage holder for day
PImage night; //PImage holder for night
int time = 0; //set time at 0
PImage sun; // PImage holder for the sun
PImage moon; //PImage holder for the moon

void setup()
{
  size(1920, 1080);
  // load our cursor images
  sun = loadImage("sun.png");
  moon = loadImage("moon.png");
  // resize them to be 300 wide, and proportionally high
  sun.resize(300, 0);
  moon.resize(300, 0);
  // load our background images
  morning = loadImage("morning.jpg");
  day = loadImage("day.png");
  night = loadImage("night.png");
}

void draw()
{
  if (time % 3 == 0) {
    background (morning);
    //morningtime background
  } else if (time % 3 == 1) {
    background (day);
    //daytime background
  } else {
    background (night);
    //nightime background
  }

  {
    if (time % 3 < 2) {
      noCursor (); //Removing cursor for more immersion
      imageMode (CENTER);
      //to center the sun on the cursor and prevents it from going completely offscreen
      image(sun, mouseX, mouseY);
      //morningtime and daytime cursor spawn
    } else {
      noCursor (); //Removing cursor for more immersion
      imageMode (CENTER);
      //to center the moon on the cursor and prevents it from going completely offscreen
      image (moon, mouseX, mouseY);
      //nightime cursor spawn
    }
  }
}
void keyPressed() 

{
  if (keyPressed == true)
    time++;
  //Advance time on any keypress
}
