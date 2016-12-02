void setup() {
  size(500, 500);
}

void draw() {
  for (int y = 0; y < 5; y++) {
    for (int x = 0; x < 5; x++) {
      rect(x * 100, y * 100, 100, 100);
    }
  }
}