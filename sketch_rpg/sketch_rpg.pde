int mapSize = 5;
int unitSize = 100;
int cX, cY;

int[][] map = {
  {0, 0, 0, 1, 0},
  {1, 0, 0, 1, 0},
  {1, 0, 1, 1, 0},
  {0, 0, 0, 0, 0},
  {0, 1, 0, 1, 1}
};

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
    int nX = cX;
    int nY = cY;
    switch (keyCode) {
      case UP:    nY--;  break;
      case DOWN:  nY++;  break;
      case LEFT:  nX--;  break;
      case RIGHT: nX++;  break;
    }
    if (map[nY][nX] == 0) {
      cX = nX;
      cY = nY;
    }
  }
}