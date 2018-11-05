PImage lilstar;
PImage moon;
PImage pstar;
PImage sun;
PImage cloud;

void setup ()
{
  size(1000, 1000);

  lilstar = loadImage ("cute_star.png");
  moon = loadImage ("moon.png");
  pstar = loadImage ("purple_star.png");
  sun = loadImage ("mr_sun.png");
  cloud = loadImage ("clouds.png");
  background(81, 106, 145);
  image(moon, 250, 250, 500, 500);  
  frameRate(15);
}

// I want to have stars in the night sky
// I want them to follow my mouse, and be random in size
// a large moon sits in the centre of the screen beause she is the best

boolean night = true;
void draw() 
{ 
  // the floats for random had to be different or else the stars overlap directly
  float r = random(75);  
  float r2 = random(120);


  if (night) {
    image(lilstar, mouseX, mouseY, r, r);
    image(pstar, mouseX+100, mouseY+100, r2, r2);
  } else {
  }
}

//when the mouse is pressed night turns into day
//the background colour changes and a sun appears at a click
//clouds will appear on the top of the screen
//clouds span the top of the screen with my for loop creating a layer of overcast

void mousePressed()
{
  night = !night;

  // ! is opposite, because i set night as true earlier
  // so everytime the mouse is pressed is resets true to false and vice-versa

  if (night) {
    background(81, 106, 145);
    image(moon, 250, 250, 500, 500);
  } else {
    background (174, 203, 249);
    image(sun, 250, 250, 500, 500);
    for (int q = 1; q < 990; q = q+ 160) {
      image(cloud, q, 10, 150, 150);
    }
  }
}
