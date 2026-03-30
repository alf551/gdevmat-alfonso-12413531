class BlackHole {
  PVector position;
  float size;

  BlackHole() {
    position = new PVector(random(width), random(height));
    size = 50;
  }

  void update() {
    position.x = mouseX;
    position.y = mouseY;
  }

  void display() {
    noStroke();
    fill(255);
    ellipse(position.x, position.y, size, size);
  }
}
