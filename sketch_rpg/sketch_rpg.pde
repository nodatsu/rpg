int mapSize = 5;
int unitSize = 100;
int cX, cY;

void setup() {
  size(500, 500);
  
  ellipseMode(CORNER);
  cX = 2;
  cY = 2;
}

void draw() {
  for (int y = 0; y < mapSize; y++) {
    for (int x = 0; x < mapSize; x++) {
      rect(x * unitSize, y * unitSize, unitSize, unitSize);
    }
  }
  
  ellipse(cX * unitSize, cY * unitSize, unitSize, unitSize);  
}

void keyPressed() {
  if (key == CODED) {
    switch (keyCode) {
      case UP:    cY--;  break;
      case DOWN:  cY++;  break;
      case LEFT:  cX--;  break;
      case RIGHT: cX++;  break;
    }
  }
}