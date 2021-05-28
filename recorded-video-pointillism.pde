//import processing.video.*;
//import controlP5.*;

Movie mov;
ControlP5 cp5;
//PFont f;

boolean spd = false;
boolean normal_speed = true;


public float speed = 1.0;
public int numdots = 500;
public int dotsz = 15;
public int cs = 0;


public int rand = int(random(0, 2));

void setup() {
  background(255);
  //f = createFont("Arial", 16, true);
  size(665, 500);
  cp5 = new ControlP5(this);

  cp5.addSlider("numdots")
    .setRange(0, 5000)
    .setValue(1000)
    .setPosition(525, 400)
    .setSize(100, 10)
    ;

  cp5.addSlider("dotsz")
    .setRange(0, 100)
    .setValue(50)
    .setPosition(525, 425)
    .setSize(100, 10)
    ;

  cp5.addToggle("spd")
    .setPosition(40, 430)
    .setSize(50, 20)
    .setValue(false)
    .setMode(ControlP5.SWITCH)
    ;

  cp5.addToggle("normal_speed")
    .setPosition(40, 400)
    .setSize(50, 20)
    ;

  mov = new Movie(this, "testmovie.mov");
  mov.loop();
}

// Display values from movie
void draw() {
  //fill(0);                         
  if (mov.available()) {
    if (spd == false && normal_speed == false) {
      mov.speed(speed);
      //mov.read();
      for (int i = 0; i < numdots; i++) {
        shape();
        shape();
        shape();
      }
      speed -= 0.01;
    } else if (spd == true && normal_speed == false) {
      mov.speed(speed);
      for (int i = 0; i < numdots; i++) {
        shape();
        shape();
        shape();
      }
      speed+=0.01;
    } else if (normal_speed == true) {
      mov.speed(1.0);
      for (int i = 0; i < numdots; i++) {
        shape();
        shape();
        shape();
      }
    }
  }
}

void shape() {
  int x = int(random(mov.width));
  int y = int(random(mov.height));
  int loc = x + y*mov.width;
  mov.read();
  mov.loadPixels();
  float r = red(mov.pixels[loc]);
  float g = green(mov.pixels[loc]);
  float b = blue(mov.pixels[loc]);
  noStroke();
  // Draw an ellipse at that location with that color
  fill(r, g, b, 100); 
  if (rand == 0) {
    ellipse(x, y, dotsz, dotsz);
  } else if (rand == 1) {
    square(x, y, dotsz);
  }
}

void keyPressed() {
  mov.pause();
}

void keyReleased() {
  mov.play();
}
