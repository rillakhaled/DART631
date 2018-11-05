PImage sun;
PImage moon;
PImage sunFlares;
PImage moonStar1;
PImage cloud;

int sunFlareSize = 200;
int sunFlareRescaleFactor = 2;

float easing = 0.05;
float easingMoonStar = 0.03;

float xMovementSunMoon;
float yMovementSunMoon;

float xMovementCloudStar;
float yMovementCloudStar;


String intro = ("DART 631, Seyed M. Tabatabaei");
String instruction = ("Press any mouse button to start or exit");


boolean myButtonPressed = false;

void setup() {
  size (1400, 800);
  noStroke();  
  imageMode(CENTER);
  moon = loadImage("moon.png");
  sun = loadImage("sun.png");
  sunFlares = loadImage("sunFlares.png");
  moonStar1 = loadImage ("moonStar1.png");
  cloud = loadImage ("cloud.png");
 

  //Background Blak/white (back to menue)
  fill(255);
  rect(0, 0, width, height/2);
  fill(0);
  rect(0, height/2, width, height);
  //------------------------------------------------------------------------------

  //Intro & Instructions
  textSize(32);
  text(instruction, 50, 350, 800, height);

  fill(255);
  text(intro, 800, 420, 1300, 600);
}

void draw() { 

  if ( !myButtonPressed) {

    //Background Blak/white (back to menue)
    fill(255);
    rect(0, 0, width, height/2);
    fill(0);
    rect(0, height/2, width, height);
    //------------------------------------------------------------------------------
    //Intro & Instructions
    textSize(32);
    text(instruction, 50, 350, 800, height);

    fill(255);
    text(intro, 800, 420, 1300, 600);
  } else if (myButtonPressed) {

    //Background color responding to mouseY
    for (int i = 0; i < mouseY; i+=255) {
      int backFillR = int(map(mouseY, height, 0, 4, 130));
      int backFillG = int(map(mouseY, height, 0, 14, 169));
      int backFillB = int(map(mouseY, height, 0, 31, 234));

      //background(backFill);
      fill(backFillR, backFillG, backFillB);
      rect(0, 0, width, height);
    }
    //-------------------------------------------------------------------------------
    // movement delays
    float targetX = mouseX;
    float delayX = targetX - xMovementSunMoon;
    xMovementSunMoon += delayX * easing;

    float targetY = mouseY;
    float delayY = targetY - yMovementSunMoon;
    yMovementSunMoon += delayY * easing;

    float targetXMoonStar = mouseX;
    float delayXMoonStar = targetXMoonStar - xMovementCloudStar;
    xMovementCloudStar += delayXMoonStar * easingMoonStar;

    float targetYMoonStar = mouseY;
    float delayYMoonStar = targetYMoonStar - yMovementCloudStar;
    yMovementCloudStar += delayYMoonStar * easingMoonStar;
    //------------------------------------------------------------------------------

    //sun Animaiton
    if (frameCount % .5 == 0) {
      sunFlareSize += sunFlareRescaleFactor;
      if (sunFlareSize <= 200 || sunFlareSize >= 220) {
        sunFlareRescaleFactor *=  -1;
      }
    }

  /*  //MoonStar Animaiton
if (frameCount % .5 == 0) {
      sunFlareSize += sunFlareRescaleFactor;
      if (sunFlareSize <= 200 || sunFlareSize >= 220) {
        sunFlareRescaleFactor *=  -1;
      }
    }*/
    //------------------------------------------------------------------------------


    //Load Images and Alpha interaction
    for (int i = 0; i<mouseY; i++) {
      int sunAlpha = int(map(mouseY, height, 0, 0, 260));
      tint(255, sunAlpha);
    }
    image(sun, xMovementSunMoon, yMovementSunMoon);
    image(sunFlares, xMovementSunMoon, yMovementSunMoon, sunFlareSize, sunFlareSize);
    image (cloud, xMovementCloudStar, yMovementCloudStar);

    //moon Alpha & moon Load
    for (int b = 0; b<mouseY; b++) {
      int moonAlpha = int(map(mouseY, 0, height, 0, 255));
      tint(255, moonAlpha);
    }
    image(moon, -(xMovementSunMoon-width), -(yMovementSunMoon-height));
    image(moonStar1, -(xMovementCloudStar-width), -(yMovementCloudStar-height),sunFlareSize/2,sunFlareSize/2 );
   

    //------------------------------------------------------------------------------

    //StarsDistance
    fill(0, 10);
    rect(0, 0, width, height);
    fill(255);
    ellipse(random(width), random(height), 5, 5);
  }
}

void mouseReleased() 
{
  myButtonPressed = !myButtonPressed;
}
