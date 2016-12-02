int mapSize = 5;
int unitSize = 100;

void setup() {
  size(500, 500);
}

void draw() {
  for (int y = 0; y < mapSize; y++) {
    for (int x = 0; x < mapSize; x++) {
      rect(x * unitSize, y * unitSize, unitSize, unitSize);
    }
  }
}