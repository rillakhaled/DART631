int avatarX = 0; // Avatar location on X
int avatarY = 0; // Avatar location on Y
int avatarSize = 10; // Avatar size (will be a square)
int avatarSpeed = 5;
int avatarVelocityX = 0; // Number of pixels avatar should move each frame on X
int avatarVelocityY = 0;

void setup()
{
  size(500, 500);
}

void draw()
{
  background(255); // Fill the background to create animation
  avatarX += avatarVelocityX; // Add the X velocity to the avatar's X location so it moves
  avatarY += avatarVelocityY; // Add the Y velocity to the avatar's Y location so it moves
  rect(avatarX, avatarY, avatarSize, avatarSize); // Draw the avatar in its new location
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