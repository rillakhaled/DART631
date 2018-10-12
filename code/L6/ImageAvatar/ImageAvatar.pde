int avatarX = 0; // Avatar location on X
int avatarY = 0; // Avatar location on Y
int avatarSize = 10; // Avatar size (will be a square)
int avatarSpeed = 5; // Avatar speed (5 pixels per update)
int avatarVelocityX = 0; // Number of pixels avatar should move each frame on X
int avatarVelocityY = 0; // Number of pixels avatar should move each frame on Y
PImage egg; // PImage holder for egg image

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
  avatarX += avatarVelocityX; // Add the X velocity to the avatar's X location so it moves
  avatarY += avatarVelocityY; // Add the Y velocity to the avatar's Y location so it moves

  // for our current background, we will work out 3 separate compontents
  // for R, G, B

  // map a value for R based on avatarX value, i.e. where egg X is on screen
  // determines where it falls between 180-255
  int rVal = int(map(avatarX, 0, 800, 0, 255));

  // map a value for G based on avatarY value, i.e. where egg Y is on screen
  // determines where it falls between 180-255
  int gVal = int(map(avatarY, 0, 600, 0, 255));
  
  // establish a value for B, let's just set it to 200, always
  int bVal = 200;

  // make a composite background color based on the R, G, B values we just came up with
  background(rVal, gVal, bVal); 

  // constrain my avatarX and avatarY to fall within visible screen
  if (avatarX < 0) {
    avatarX = 0;
  }
  if (avatarX >= width-egg.width) {
    // make the side of my avatar lean against the “width” boundary
    // work this out based on egg.width
    avatarX = width-egg.width;
  }
  if (avatarY < 0) {
    avatarY = 0;
  }
  if (avatarY >= height-egg.height) {
    // make the top of my avatar sit on the “height” boundary
    // work this out based on egg.height
    avatarY = height-egg.height;
  }
  // Draw the avatar in its new location
  image(egg, avatarX, avatarY);
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