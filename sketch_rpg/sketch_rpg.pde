Map map;

void setup() {
  size(500, 500, P2D);

  map = new Map();
}

void draw() {
  map.update();
}

void keyPressed() {
  map.input();
}