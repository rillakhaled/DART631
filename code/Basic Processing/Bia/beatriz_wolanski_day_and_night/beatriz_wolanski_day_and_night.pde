PImage sun;
PImage moon;
PImage mountains_day;
PImage mountains_night;
PImage snow_button;
PImage clouds;

boolean snowing = false;
int[] snow;
int totalSnow = 800;


void setup ()
{

  size(1600, 1200);

  //loading images
  sun = loadImage("sun.png");
  moon = loadImage("moon.png");
  mountains_day = loadImage("mountains_day.png");
  mountains_night = loadImage("mountains_night.png");
  snow_button = loadImage("snow_button.png");
  clouds = loadImage("clouds.png");

  //arrays
  snow = new int [totalSnow];
  for (int i = 0; i < totalSnow; i++) {
    snow[i] = int(random(-10, 1200)); //so that the snow does not fall as a "line"
  }
}

void draw ()
{
  //SUN CONTROLS
  //map the position of the mouse (sun) to color the background from day blue (204,230,254) to night blue (37,37,69)
  float constrainY = constrain(mouseY, 600, 1200);
  int rBackground = int(map(constrainY, 600, 1200, 204, 37));
  int gBackground = int(map(constrainY, 600, 1200, 230, 37));
  int bBackground = int(map(constrainY, 600, 1200, 254, 69));

  background (rBackground, gBackground, bBackground);

  //CLOUDS
  tint(255, 100);
  image(clouds, 0, 50);

  //constrain the sun position so it does not exceeds the screen
  float constrainSunY = constrain(mouseY, 400, 1200);
  tint(255, 255);//because of the tint for the moon, had to put one here too
  image(sun, 300, constrainSunY);

  //MOON CONTROLS
  int nightAlpha = int(map(constrainY, 600, 1200, 0, 255)); //the alpha of night elements reacts to the position of the sun
  tint(255, nightAlpha);
  image(moon, 1150, 400);

  //SNOW CONTROLS
  //snow button
  tint(255, 255);
  image(snow_button, 20, 20);

  ////now the tricky part!!!
  //'for' snow commands start here
  if (snowing)
  {
      for (int i = 0; i < totalSnow; i++) {
      noStroke();
      fill(255,100);
      ellipse(width/totalSnow*i, snow[i], 10, 10);
      snow[i] = snow[i] + int(random(1, 5)); //updatting Y location (snowflake "speed" per frame)
      if (snow[i] > height) {
        snow[i] = 0;
      }
    }
  } 

  //snow commands end here


  //MOUNTAINS CONTROLS
  tint(255, 255);
  image(mountains_day, 0, 777);

  tint(255, nightAlpha);
  image(mountains_night, 0, 777);
}

void keyReleased ()
{
  //detects if "s" was pressed, and changes the current status (to off if on; to on if off)
  //println("key release detected");
  if (key == 's' || key == 'S') {
  // println("key release detected inside if");

    snowing = !snowing;
  }
}

//Copyright notice: Images by Freepik
