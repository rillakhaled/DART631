
// falling - 1st line - 1st position
// falling - 1st line - 8th position

void falling() {

  float ruidoX4 = -0.00001;
  float posX4 = noise(millis() * ruidoX4) * 200;
  float ruidoY4 = -0.00018;
  float posY4 = noise(millis() * ruidoY4) * 200;  

  float ruidoC4 = 0.0008;
  float posC4 = noise(millis() * ruidoC4) * 30; 

  float ruidoD = 0.0008;
  float posD = noise(millis() * ruidoD) * 52; 

  int fog = millis()/2009;
  float between = random(30);
  float between2 = random(7);
  // rotate(radians(fog%random(10222)));
  //translate(fog%10, +fog%4);

  float historyOfNothing = fog%20;

  float dust = tan(radians(historyOfNothing))%width*1500;

  for (int inYourFall = 0; inYourFall < 10; inYourFall++) {

    rotate(radians(fog%-8)*40);
    noFill();
    // fill(255, 10);

    noFill();
    stroke(#AFE7F5, 180);
    ellipse(10, posD, posC4, posC4);

    noFill();
    stroke(#FFD117, 180);
    strokeWeight(2);
    line(100, posD, 100, posC4);
  }
} 