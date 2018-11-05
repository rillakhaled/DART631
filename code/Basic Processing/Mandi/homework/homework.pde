PImage pp; // PImage holder for pp image (pp is my dog)
PImage lifeofpp;
PImage bone;
PImage goodboy;
PImage day;
PImage night;

int avatarX = 350; // pp location on X
int avatarY = 350; // pp location on Y
int avatarSize = 10; // pp size 
int avatarSpeed = 10; // pp speed (5 pixels per update)
int avatarVelocityX = 0; // Number of pixels pp should move each frame on X
int avatarVelocityY = 0; // Number of pixels pp should move each frame on Y



void setup()
{
  size(800, 600);
  // load our image
  pp = loadImage("pp.png");
    pp.resize(120, 0);
  lifeofpp = loadImage("lifeofpp.png");
    lifeofpp.resize(400,0);
  bone = loadImage("bone.png");
    bone.resize(50,0);
  goodboy=loadImage("goodboy.png");
    goodboy.resize(150,0);
  day=loadImage("day.png");
  night=loadImage("night.png");
 
//resize them to the right size 
  

}

void draw()
{
  for (int i=100; i<209; i=i+10) {
  line (150,i,650,i);//draws the lines behind "life of pp"
}
  if (avatarX<width/2){ //when pp moves pass the middle point, switch the image to "night"
    image(day,0,0);
  }
  else {
    image(night,0,0);
  }
  image(lifeofpp,200,110); //title that hangs in the middle 
  image(bone,1000,1000);
  rect(150,100,500,100); //rectangle around the title"life of pp"
      stroke(random(255),random(100),200);
      strokeWeight(7);  
      noFill();
   

  
  avatarX += avatarVelocityX; 
  avatarY += avatarVelocityY; 
 
  // constrain pp
  if (avatarX < 0) {
    avatarX = 0;
  }
  if (avatarX >= width-pp.width) {
    // make the side of my avatar lean against the “width” boundary
    // work this out based on egg.width
    avatarX = width-pp.width;
  }
  if (avatarY < 0) {
    avatarY = 0;
  }
  if (avatarY >= height-pp.height) {
    // make the top of my avatar sit on the “height” boundary
    // work this out based on pp.height
    avatarY = height-pp.height;
  }
  // Draw the avatar in its new location
  image(pp, avatarX, avatarY);

}
void mousePressed()
{
  image(bone,mouseX,mouseY);
}

void mouseReleased()
{
  image(goodboy,mouseX+32,mouseY);
}
void keyPressed() ///movement of pp with keyboard control 
{
 
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
