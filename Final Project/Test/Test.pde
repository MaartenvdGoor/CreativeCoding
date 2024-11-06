cube startCube;
ArrayList<cube>cubes = new ArrayList<cube>();
float startPointX = 0;
float startPointY = 0;
float currentWidth = 0;
float currentHeight = 0;

boolean dragging = false;
boolean filledCube = true;


void setup() {
  size(1000, 1000);
  //startCube = new cube(75, 75, new PVector(width/2, height/2), color(255));
  //cubes.add(startCube);
  //fullScreen();
}

void draw() {
  background(0);
  for (cube selCube : cubes) {
    selCube.drawSquare();
  }

  println(cubes.size());
  if (mouseButton == RIGHT && dragging) {
    noFill();
    stroke(255);
    rectMode(CORNER);
    currentWidth = mouseX - startPointX;
    currentHeight = mouseY - startPointY;
    rect(startPointX, startPointY, currentWidth, currentHeight);
  }
}

void mousePressed() {
  //Sets variables used for the outline and eventualy spawning the cube
  if (mouseButton == RIGHT) {
    startPointX = mouseX;
    startPointY = mouseY;
    dragging = true;
  }
  // Moves all the cubes towards the current mouse position
  if (mouseButton == LEFT) {
    for (cube selCube : cubes) {
      selCube.moveTowardsMouse(mouseX, mouseY);
    }
  }
}

void mouseReleased() {

  //Spawn cube in when the right mouse button is released.
  if (mouseButton == RIGHT) {
    if (currentWidth < 0) currentWidth = constrain(currentWidth, -width, -2);
    else currentWidth = constrain(currentWidth, 2, width);
    if (currentHeight < 0) currentHeight = constrain(currentHeight, -height, -2);
    else currentHeight = constrain(currentHeight, 2, height - currentWidth);
    cube newCube = new cube(currentWidth, currentHeight, new PVector(startPointX + currentWidth / 2, startPointY + currentHeight / 2), color(random(255), random(255), random(255)), filledCube);
    cubes.add(newCube);
    println("newCube");
  }
}

void keyPressed() {
  // Spawn in 100 small cubes of a random size.
  if (key == ENTER) {
    float randomWidth = random(1, 5);
    float randomHeight = random(1, 5);
    for (int i = 0; i< 100; i++) {
      cube newCube = new cube(randomWidth, randomHeight, new PVector(constrain(mouseX, 0 + randomWidth/2, width - randomWidth/2), constrain(mouseY, 0 + randomHeight/2, height - randomHeight/2)), color(random(255), random(255), random(255)), true);
      cubes.add(newCube);
    }
  }
  // Switches from filled cubes to just outlines
  if (key == 'f' || key == 'F') {
    filledCube = !filledCube;
  }

  //clears the screen of cubes
  if (key == 'c' || key == 'C') cubes.clear();
}
