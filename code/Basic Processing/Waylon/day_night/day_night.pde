PImage newCursor1;
PImage newCursor2;
PImage ground1;
PImage ground2;

void setup()
{
  size (400, 850);
  background(15, 15, 100);
  frameRate (10);
  newCursor1 = loadImage ("cursor1.png");
  newCursor2 = loadImage ("cursor2.png");
  ground1 = loadImage ("ground1.png");
  ground2 = loadImage ("ground2.png");
}

void draw() {
  if ( mouseY < height/6 *5) 
    {
      background(15, 15, 100);
      cursor(newCursor1);
      for (int i = 0; i < width; i++) 
         {
           stroke(255);
           point(i, random(0,height));
         }
     }else{
   if (mouseY > height / 6) 
      {
     cursor(newCursor2);
    }
  }
    if (mouseY > height/6*5 )
       {
         image(ground1, 0, 50);
       }
    if (mouseY > height/6*5 && mouseX < width/2 
       && mouseX > width/4 && mousePressed == true)
       {
         image(ground2, 0, 50);
       }
}
