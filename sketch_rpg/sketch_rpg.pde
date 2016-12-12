Map map;

void setup() {
  size(500, 500);

  map = new Map();
}

void draw() {
  map.update();
}

void keyPressed() {
  map.input();
}