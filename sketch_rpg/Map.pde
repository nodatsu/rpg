class Map {
  int mapSize = 15;
  int unitSize = 100;
  int cX, cY;

  int[][] map = new int[mapSize][mapSize];

  PImage charTex;
  int dir;
  int pose;

  Map() {
    ellipseMode(CORNER);
    cX = mapSize/2;
    cY = mapSize/2;
    init();
    
    charTex = loadImage("general man 01.png");
    dir = 0;
    pose = 0;
  }

  void update() {  
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
        case 2:
          fill(255, 255, 0);
          break;
        case 9:  
          fill(0);
          break;
        }
        rect(x * unitSize, y * unitSize, unitSize, unitSize);
      }
    }
    // キャラ表示(円)
    //fill(255, 0, 0);
    //ellipse(cX * unitSize, cY * unitSize, unitSize, unitSize);
    // キャラ表示(絵)
    //image(charTex, cX * unitSize, cY * unitSize, unitSize, unitSize);
    beginShape();
    texture(charTex);
    vertex(cX * unitSize, cY * unitSize,             dir * 24,       pose * 24);
    vertex((cX + 1) * unitSize, cY * unitSize,       (dir + 1) * 24, pose * 24);
    vertex((cX + 1) * unitSize, (cY + 1) * unitSize, (dir + 1) * 24, (pose + 1) * 24);
    vertex(cX * unitSize, (cY + 1) * unitSize,       dir * 24,       (pose + 1) * 24);
    endShape();
  }

  void input() {  
    if (key == CODED) {
      int nX = cX;
      int nY = cY;
      switch (keyCode) {
      case UP: 
        dir = 1;
        nY--;  
        break;
      case DOWN:
        dir = 0;
        nY++;  
        break;
      case LEFT:
        dir = 2;
        nX--;  
        break;
      case RIGHT:
        dir = 3;
        nX++;  
        break;
      }
      if (map[nY][nX] == 0 || map[nY][nX] == 2) {
        cX = nX;
        cY = nY;
        pose++;
        pose %= 2;
        if (map[nY][nX] == 2) {
          println("イベント");
        }
      }
    }
  }

  void init() {
    for (int y = 0; y < mapSize; y++) {
      for (int x = 0; x < mapSize; x++) {     
        map[y][x]=int(random(0, 1.2));
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

    map[5][9] = 2;
  }
}