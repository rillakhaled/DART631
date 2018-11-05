//Follow Me, Day and Night 
//by Firdous Nizar
/*Concept:A Sun moves around the screen(the sky) and the mouse cursor is a white cloud. - Day Scene
          When the mouse is pressed, the Sun is now a Moon and the cloud is now dark. - Night Scene */
/*Note: The sky shifts between a range of colors that represent day(yellow-orange) and 
        night(blue-purple)*/
PImage Sun;
PImage Moon;
PImage Cloud;
PImage CloudDark;
float locY=0;//y location of image of Sun/Moon(x location is based on mouseX)
int check=1;//variable that checks for mouse input and activates day/night scene accordingly(default day scene)

void setup()//sets the screen size & loads all images(also sets the framerate)
{
  size(1000, 1000);
  Sun = loadImage("sun.png");
  Moon = loadImage("moon1.png");
  Cloud = loadImage("cloud.png");
  Cloud.resize(300,0);
  CloudDark = loadImage("clouddark.png");
  CloudDark.resize(300, 0);
  frameRate(50);
}

void draw()
{
  for(int i=0; i<height-200; i++)
   {
     locY = random(0,i);/*y location of image of Sun/Moon is randomized within for loop 
                          between the range of 0 to height-200(-200 accounts for part of 
                          width of image)*/
     if(check==1)
       {
         int b=int(map(mouseX, 0, width, 50, 100));/*mapping colours within yellow-orange 
                                                     range to represent daylight*/
         int g= int(map(locY, 0, height, 150, 255));
         background(255, g, b);
         image(Sun, mouseX, locY);//draws Sun that moves along mouseX but randomly up and down y-axis @ 50fps
         image(Cloud, mouseX, mouseY); //draws white cloud that moves along with cursor @ 50fps(not smooth)
       }
     else
       {
         int r=int(map(mouseX, 0, width, 50, 150));/*mapping colours within blue-purple 
                                                     range to represent night*/
         int g= int(map(locY, 0, height, 50, 200));
         background(r, g, 255);
         image(Moon, mouseX, locY);//draws Moon that moves along mouseX but randomly up and down y-axis @ 50fps
         image(CloudDark, mouseX, mouseY);//draws dark cloud that moves along with cursor @ 50fps
        }
   }
}

void mousePressed()//Activating Night Scene
{
  check=0;/*This variable checks the condition for the night/day scene to be in action.
            When it is 0, it activates the night scene, and when it is 1, it activates
            the day scene.*/
}

void mouseReleased()//Default Day Scene
{
  check=1;
}
