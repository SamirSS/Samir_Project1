float xcoord1 = 365;
float ycoord1 = 232.5;
float xcoord2 = 200;
float ycoord2 = 266;
float xcoord3 = 700;
float ycoord3 = 310;
int move;


void setup() {
  size(800, 600);
  background(255);
}

void draw() {
  smooth();
  background(255);
  drawVolcano(65);
  erupt();
  cloud();
}

void drawVolcano(int volcanoTop) {
  for(int i = 0; i < 100; i++){
    if(mousePressed){
      stroke(78, 41, 42);
      stroke(78, 41, 42);
      // bottom part of volcano
      line(0+50, 450, width+50, 450);
      // left edge
      line(0+50, 375, 150+50, 300);
      line(150+50, 300, 300+50, 200);
      // right edge
      line(width+50, 350, 430+50, 200);
      // volcano opening
      fill(100);
      arc(365+50, 200, 130, volcanoTop, 0, PI, OPEN);
    }
    else {
      stroke(78, 41, 42);
      stroke(78, 41, 42);
      // bottom part of volcano
      line(0, 450, width, 450);
      // left edge
      line(0, 375, 150, 300);
      line(150, 300, 300, 200);
      // right edge
      line(width, 350, 430, 200);
      // volcano opening
      fill(100);
      arc(365, 200, 130, volcanoTop, 0, PI, OPEN);
    }
  }
}

void smoke() {
  // weird symmetrical, spotlight looking smoke eruption
  fill(100);
  stroke(100);
  quad(300, 200, 200, 0, 530, 0, 430, 200);
}

void lavaArcs() { 
  // shooting lava from the eruption
  // random between 250/480 for x & 200/300 for y
  for (int i = 0; i < 6; i++) {
    frameRate(5);
    arc(random(200, 250), random(200, 250), random(10, 90), random(100, 150), PI+QUARTER_PI, TWO_PI);
  }
  for (int i = 0; i < 6; i++) {
    frameRate(5);
    arc(random(480, 530), random(200, 250), random(10, 90), random(100, 150), PI, TWO_PI-QUARTER_PI);
  }
}

void lavaCracks() {
  // x-random = variable
  // y-random = variable
  // while above bottom line
  // line(xcoord, ycoord, x-random, y-random)

  //// lava cracks running down the side
  //for(int i = 0; i < 50; i++) {
  //  if(xcoord > 300 && xcoord < 430) {
  //    line(xcoord, ycoord, xcoord + random(-20, 20), ycoord + random(-20, 20));
  //    xcoord = xcoord + random(-20, 20);
  //    ycoord = ycoord + random(-20, 20);

  //    for(int j = 0; j < 50; j++) {
  //      line(xcoord, ycoord, xcoord + random(-20, 20), ycoord + random(-20, 20));
  //      xcoord = xcoord + random(-20, 20);
  //      ycoord = ycoord + random(-20, 20);
  //    }
  //  }
  //}

  boolean temp = true;
  int temp1 = 1;
  int temp2 = 1;
  int temp3 = 1;

  while (temp) {
    // crack 1
    if (mousePressed && temp1 % 2 == 1) {
      line(xcoord1, ycoord1, xcoord1 + 20, ycoord1 + 50);
      xcoord1 += 20;
      ycoord1 += 50;
    } else if (mousePressed && temp1 % 2 == 0) {
      line(xcoord1, ycoord1, xcoord1 - 60, ycoord1);
      xcoord1 -= 60;
    }
    if (ycoord1 >= 450) {
      temp = false;
    }
    temp1 += 1;

    // crack 2
    if (mousePressed && temp2 % 2 == 1) {
      line(xcoord2, ycoord2, xcoord2 + 10, ycoord2 + 30);
      xcoord2 += 10;
      ycoord2 += 30;
    } else if (mousePressed && temp2 % 2 == 0) {
      line(xcoord2, ycoord2, xcoord2 - 20, ycoord2);
      xcoord2 -= 20;
    }
    if (ycoord2 >= 450) {
      temp = false;
    }
    temp2 += 1;

    // crack 3
    if (mousePressed && temp3 % 2 == 1) {
      line(xcoord3, ycoord3, xcoord3 + 10, ycoord3 + 50);
      xcoord3 += 10;
      ycoord3 += 50;
    } else if (mousePressed && temp3 % 2 == 0) {
      line(xcoord3, ycoord3, xcoord3 - 20, ycoord3);
      xcoord3 -= 20;
    }
    if (ycoord3 >= 450) {
      temp = false;
    }
    temp3 += 1;
  }
}

void cloud() {
  // sin wave cloud
  // from a class example
  stroke(200);
  fill(0);
  float angle = 0.0;
  for (int x = 0; x <= width; x += 5) {
    float y = 50 + (sin(angle) * 35.0);
    rect(x, y, 2, 4);
    angle += PI/40.0;
  }
}

void river() {
  //if(keyPressed){
  //  if(key == 'w') {
  //    move+=5;
  //  }
  //  else if(key == 's') {
  //    move-=5;
  //  }
  //}

  //for (int x = 0; x <= width; x += 100) {
  //  for (int y = 500; y <= 600; y += 50) {
  //    line(x+10+move, y+10, x-10+move, y+10);
  //  }
  //}
}

void erupt() {
  // volcano erupts after mouse press
  if (mousePressed) {
    smoke();
    noFill();
    stroke(207, 16, 32);
    lavaArcs();
    lavaCracks();
  }
}