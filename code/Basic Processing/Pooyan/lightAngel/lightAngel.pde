// Day and Night Project Designed by Pooyan Alizadeh | Oct 29
// The Narration: our little Lucifer wants to ask God to let the sun to come up again. on his way he has some problems
// press Start (UP) -> (mousePressed) to Pass the challenges -> ask God for light [!] -> (DOWN) Game Finishes

// Defning our animations.
Animation animation1, animation2, animation3, animation4, animation5;

// The Sequences of the GIF files are classified here
// Thanks to Processing References.
class Animation {
  PImage[] images;
  int imageCount;
  int frame;

// Getting our files loaded as a gif with partial sequences.
Animation(String imagePrefix, int count) {
    imageCount = count;
    images = new PImage[imageCount];
    for (int i = 0; i < imageCount; i++) {
      String filename = imagePrefix + nf(i, 4) + ".gif";
      images[i] = loadImage(filename);
    }
  }

  void display(float xpos, float ypos) {
    frame = (frame+1) % imageCount;
    image(images[frame], xpos, ypos);
  }
  
  int getWidth() {
    return images[0].width;
  }
}

// Defining our floating values for positioning the character.
float xpos;
float ypos;
float drag = 30.0;

// Setting up our background color and size and the frameRate
void setup() {
  size(720, 540);
  background(0, 0, 0);
  frameRate(18);

// Referring Our Animation 
  animation2 = new Animation("PT_Shifty_", 91);
  animation1 = new Animation("PT_Teddy_", 13);
  animation3 = new Animation("PT_Meti_", 61);
  animation4 = new Animation("PT_Background_", 328);
  animation5 = new Animation("PT_End_", 97);

// Setting the hero's Y location in the program  
  ypos = height * 0.65;
}

// START = UP KEY, END = DOWNKEY
// to be honest this is not the most final version, the game should end when our hero hits an object, 
// so the game plays need more work, eventhough it shows  the concept 'Night and Day'

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
    animation3.display(0, 0); 
    } else if (keyCode == DOWN) {
    animation5.display(0, 0); 
    } 
  } else {
    animation1.display(0, 0);
  }
}

// the Game STARTS | If your press and hold the mouse button it will lead our character in his journey.
void draw() {
  if (mousePressed) {
    animation4.display(0, 0);
    animation1.display(xpos-animation1.getWidth()/2, ypos);
    float dx = mouseX - xpos;
    xpos = xpos + dx/drag;
    } 
    else {
// if you let go off the button you restart the game and lose.    
    background(0, 0, 0);
    animation2.display(0, 0);
  }
}
