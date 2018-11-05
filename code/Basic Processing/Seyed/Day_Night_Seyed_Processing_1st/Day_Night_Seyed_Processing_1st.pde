PImage trmp;
PImage obma;
PImage randomLeft;
PImage randomRight;
float imagesAlpha = 0;
boolean myButtonPressed = false;

String intro = ("DART 631, Seyed M. Tabatabaei");
String instruction = ("While holding any key on the keyboard, gently move the cursor to the left or right.");
String Start = ("Press any mouse button to start or exit");


void setup() {

  size (1400, 800);
  trmp = loadImage ("TRMP.png");
  obma = loadImage("OBMA.png");

  //Background Blak/white (back to menue)
  fill(255);
  rect(0, 0, width/2, height);
  fill(0);
  rect(width/2, 0, width, height);
  //------------------------------
  //Intro & Instructions

  textSize(32);
  text(instruction, 50, 200, 600, height);
  text(Start, 50, 400, 600, height);
  fill(255);
  text(intro, 800, 700, 1300, 600);
}

void draw () {

  if ( !myButtonPressed) {

    //Background Blak/white (back to menue)
    fill(255);
    rect(0, 0, width/2, height);
    fill(0);
    rect(width/2, 0, width, height);
    //------------------------------
    //Intro & Instructions
    textSize(32);
    text(instruction, 50, 200, 600, height);
    text(Start, 50, 400, 600, height);
    fill(255);
    text(intro, 800, 700, 1300, 600);
  } else if (myButtonPressed) 
  {
    //Background color responding to mouseX
    for (int i = 0; i < 255; i+=255) {
      int backFill = int(map(mouseX, 0, width, 0, 255));

      //background(backFill);
      background(backFill);
    }
    
    //LoadImages & Call Alpha Transition Functions
    AlphaTransition ();
    image(obma, 0, 0);
    AlphaTransitionReverse ();
    image(trmp, 0, 0);

    //Random Images on Right & Left
   
    randomRight = loadImage ("TR_" + (int((random(0, 4))) + ".png"));
    randomLeft = loadImage ("MB_" + (int((random(0, 4))) + ".png"));
    //-----------------------------------------------------------
    //load Random Images
    if (mouseX-pmouseX <0 && mouseX<width/2 &&  keyPressed) {
      AlphaTransitionRandomImagesReverse ();
      image(randomLeft, 0, 0);
    } else if (mouseX-pmouseX >0 && mouseX>width/2 && keyPressed) {
       AlphaTransitionRandomImages ();
      image(randomRight, 0, 0);
    }

    //-----------------------------------------------------------
    //TV noise effect
    fill(255);
    noStroke();
    ellipse(random(width), random(height), 5, 5);  //splotchy noise
    ellipse(random(width), height/2, .5, 800);  //Vertical noise
  }
}
void mouseReleased() 
{
  myButtonPressed = !myButtonPressed;
}

void AlphaTransition ()
{
  for (int i  = 0; i<255; i++) {
    imagesAlpha = int(map(mouseX, 0, width, 0, 255));
    tint (255, imagesAlpha);
  }
}
void AlphaTransitionReverse ()
{
  for (int i  = 0; i<255; i++) {
    imagesAlpha = int(map(mouseX, width, 0, 0, 255));
    tint (255, imagesAlpha);
  }
}

void AlphaTransitionRandomImages ()
{
  for (int i  = 0; i<255; i++) {
    imagesAlpha = int(map(mouseX, 0, width, 0, 200));
    tint (255, imagesAlpha);
  }
}

void AlphaTransitionRandomImagesReverse ()
{
  for (int i  = 0; i<255; i++) {
    imagesAlpha = int(map(mouseX, width, 0, 0, 200));
    tint (255, imagesAlpha);
  }
}
