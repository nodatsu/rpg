int mapSize = 15;
int unitSize = 100;
int cX, cY;

int[][] map = new int[mapSize][mapSize];

void setup() {
  size(500, 500);

 
  ellipseMode(CORNER);
  cX = mapSize/2;
  cY = mapSize/2;
  mapInit();
}

void draw() {
  translate(-unitSize, -unitSize);
  translate(-(cX-3)*unitSize, -(cY-3)*unitSize);
  for (int y = 0; y < mapSize; y++) {
    for (int x = 0; x < mapSize; x++) {
      switch (map[y][x]) {
      case 0:  
        fill(0, 255, 0);  
        break;
      case 1:  
        fill(0, 0, 255);  
        break;
      case 9:  
        fill(0);
        break;
      }
      rect(x * unitSize, y * unitSize, unitSize, unitSize);
    }
  }
  fill(255, 0, 0);
  ellipse(cX * unitSize, cY * unitSize, unitSize, unitSize);
}

void keyPressed() {
  if (key == CODED) {
    int nX = cX;
    int nY = cY;
    switch (keyCode) {
    case UP:    
      nY--;  
      break;
    case DOWN:  
      nY++;  
      break;
    case LEFT:  
      nX--;  
      break;
    case RIGHT: 
      nX++;  
      break;
    }
    if (map[nY][nX] == 0) {
      cX = nX;
      cY = nY;
    }
  }
}

void mapInit() {
  for (int y = 0; y < mapSize; y++) {
    for (int x = 0; x < mapSize; x++) {     
      map[y][x]=int(random(0, 2));
    }
  }

  for (int x = 0; x < mapSize; x++) {     
    map[0][x]=9;
    map[mapSize-1][x]=9;
  }
  for (int y = 0; y < mapSize; y++) {     
    map[y][0]=9;
    map[y][mapSize-1]=9;
  }
  map[cX][cY] = 0;
  
}