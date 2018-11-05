

int var;          
int dato;   
int contador;
int girar;

void setup() {
  size(400, 400, P3D);
}

void draw() {
  var = var + dato;
  noStroke();
  background(0);

  if (var <= 0) {
    dato = 1;
    var++;
  }

  if (var >= 255) {
    dato = -1;
    var--;
  }

  translate(width/2, height/2, var);

  if (contador <= 500) {
    rectMode(CENTER);
    //fill(255, var);
    fill(255);
    rect(0, 0, 100, 100);
    fadeIn();
    if (contador >= 255)
      fadeOut();
  }

  // resetear fades en 500

  if (contador == 500) {
    alphaIn = 255;
    alphaOut = 0;
  }

  if (contador >= 500 && contador <= 1000) {
    rectMode(CENTER);
    fill(255, 0, var);
    ellipse(0, 0, 100, 100);
    fadeIn();
    if (contador >= 755)
      fadeOut();
  }

  // resetear fades en 1000

  if (contador == 1000) {
    alphaIn = 255;
    alphaOut = 0;
  }

  if (contador >= 1000 && contador <= 1500) {
    rectMode(CENTER);
    lights();
    stroke(0);
    fill(0, 255, var);
    rect(0, 0, 50, 50);
    fadeIn();
    if (contador >= 1255)
      fadeOut();
  }
  contador++;
}