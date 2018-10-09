int avatarX = 0; // Avatar location on X
int avatarY = 0; // Avatar location on Y
int avatarSize = 10; // Avatar size (will be a square)
int avatarSpeed = 5; // Avatar speed (5 pixels per update)
int avatarVelocityX = 0; // Number of pixels avatar should move each frame on X
int avatarVelocityY = 0; // Number of pixels avatar should move each frame on Y

PImage egg; // PImage holder for egg image

float boxLHS = 0; // left hand side (LHS) for our hitbox
float boxRHS = 300; // right hand side (RHS) of hitbox
float boxTop = 0; // top of box
float boxBottom = 300; // bottom of box

boolean insideBox = true; // is avatar currently inside the box

void setup()
{
  size(800, 600);
  // load our image
  egg = loadImage("gudetama.png");

  // resize it to be 150 wide, and proportionally high
  egg.resize(150, 0);
}

void draw()
{
  // have 180 frames passed? if so
  if (frameCount % 180 == 0) {
    // change the location of our box by calling redrawBox method
    redrawBox();
  }
  avatarX += avatarVelocityX; // Add the X velocity to the avatar's X location so it moves
  avatarY += avatarVelocityY; // Add the Y velocity to the avatar's Y location so it moves

  // for our current background, we will work out 3 separate compontents
  // for R, G, B

  // map a value for R based on avatarX value, i.e. where egg X is on screen
  // determines where it falls between 180-255
  int rVal = int(map(avatarX, 0, 800, 180, 255));

  // map a value for G based on avatarY value, i.e. where egg Y is on screen
  // determines where it falls between 180-255
  int gVal = int(map(avatarY, 0, 600, 180, 255));

  int bVal;
  // if avatar is inside the box, have bVal change all the time
  if (insideBox) {
    bVal = int(random(0, 255));
  }
  // otherwise just have it set to stable 200
  else {
    bVal = 200;
  }

  // make a composite background color based on the R, G, B values we just came up with
  background(rVal, gVal, bVal); 

  // draw the location of the hitBox
  noFill();
  stroke(255);
  rect(boxLHS, boxTop, 300, 300);

  // constrain avatarX and avatarY to fall within visible screen
  if (avatarX < 0) {
    avatarX = 0;
  }
  if (avatarX >= width-egg.width) {
    // make the side of avatar lean against the “width” boundary
    // work this out based on egg.width
    avatarX = width-egg.width;
  }
  if (avatarY < 0) {
    avatarY = 0;
  }
  if (avatarY >= height-egg.height) {
    // make the top of avatar sit on the “height” boundary
    // work this out based on egg.height
    avatarY = height-egg.height;
  }
  
  // Draw the avatar in its new location
  image(egg, avatarX, avatarY); 
  
  // check whether avatar is inside the box
  checkOverlap();
}

void keyPressed()
{
  // Check which key just got pressed and change the avatar's velocity appropriately!
  // Note that Processing has built in variables UP, DOWN, LEFT, RIGHT which store the
  // keyCode of the corresponding arrow key!
  if (keyCode == UP)
  {
    avatarVelocityY = -avatarSpeed;
  }
  if (keyCode == DOWN)
  {
    avatarVelocityY = avatarSpeed;
  }
  if (keyCode == LEFT)
  {
    avatarVelocityX = -avatarSpeed;
  }
  if (keyCode == RIGHT)
  {
    avatarVelocityX = avatarSpeed;
  }
}

void keyReleased()
{
  // Check which key got let go and set the avatar's velocity in that direction
  // to be zero so it stops when you let go of a key!
  if (keyCode == UP)
  {
    avatarVelocityY = 0;
  }
  if (keyCode == DOWN)
  {
    avatarVelocityY = 0;
  }
  if (keyCode == LEFT)
  {
    avatarVelocityX = 0;
  }
  if (keyCode == RIGHT)
  {
    avatarVelocityX = 0;
  }
}

/* redrawBox() method that redraws box to random location on screen updates variables that
are box position related */
void redrawBox() {
  boxLHS = random(0, width-300);
  boxRHS = boxLHS+300;
  boxTop = random(0, height-300);
  boxBottom = boxTop+300;
}

/* checkOverLap() method checks whether my egg avatar falls within the boundaries of the 
box. It updates the insideBox variable to be true or false accordingly. */
void checkOverlap() {
  if (avatarX > boxLHS && avatarX+egg.width <= boxRHS && avatarY > boxTop && avatarY+egg.height <=boxBottom) {
    insideBox = true;
  } else {
    insideBox = false;
  }
}