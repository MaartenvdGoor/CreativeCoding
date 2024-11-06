class cube {
  
  //init vars
  float cubeHeight;
  float cubeWidth;
  float moveSpeed = 10;
  float Hspeed = random(moveSpeed) - moveSpeed/2;
  float Vspeed = random(moveSpeed) - moveSpeed/2;  
  PVector startPos = new PVector(height/2, width/2);
  color selColor;
  int maxChangePercentage = 25;
  
  boolean fillCube = true;
  float rotation = 0;
  
  cube(float w, float h, PVector initPos, color col, boolean filledCube) {
    cubeHeight = h;
    cubeWidth = w;
    startPos = initPos;
    selColor = col;
    fillCube = filledCube;
  }
  
  //Draws the square based on the parameters given. after which it calls the move cube update.
  void drawSquare() {
    rectMode(CENTER);
    if(fillCube){
      noStroke();
      fill(selColor);
    }
    else{
      noFill();
      strokeWeight(4);
      stroke(selColor);
    }
    rect(startPos.x, startPos.y, cubeWidth, cubeHeight);
    moveCube();
  }
  
  //Moves the Cube. 
  void moveCube() {
    startPos.x += Hspeed;
    startPos.y += Vspeed;
    checkBorder();
  }
  
  void checkBorder() {
    if (cubeWidth >= 0) {
      if (startPos.x + cubeWidth/2 >= width || startPos.x - cubeWidth/2 <= 0) {
        Hspeed *= random(0.75,1.25) * -1;
      }
    } else {
      if (startPos.x - cubeWidth/2 >= width || startPos.x + cubeWidth/2 <= 0) {
        Hspeed *= random(0.75,1.25) * -1;
      }
    }
    if (cubeHeight >= 0) {
      if (startPos.y + cubeHeight/2 >= height || startPos.y - cubeHeight/2 <= 0) {
        Vspeed *= random(0.75,1.25) * -1;
      }
    } else {
      if (startPos.y - cubeHeight/2 >= height || startPos.y + cubeHeight/2 <= 0) {
        Vspeed *= random(0.75,1.25) * -1;
      }
    }

  }

  void moveTowardsMouse(float mX, float mY) {
    Hspeed = map(mX - startPos.x, -(width), width, -moveSpeed, moveSpeed);
    Vspeed = map(mY - startPos.y, -(height), height, -moveSpeed, moveSpeed);
  }
}
