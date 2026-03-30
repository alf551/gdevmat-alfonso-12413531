class Matter {
  PVector position;
  PVector velocity;
  float size;
  color c;
  boolean active;

  Matter() {
    float x = width / 2 + (float)randomGaussian() * 150;
    float y = height / 2 + (float)randomGaussian() * 100;

    x = constrain(x, 0, width);
    y = constrain(y, 0, height);

    position = new PVector(x, y);
    velocity = new PVector(0, 0);

    size = random(8, 30);
    c = color(random(255), random(255), random(255));
    active = true;
  }

  void moveTowards(PVector target, float blackHoleSize) {
    if (!active) {
      return;
    }

    PVector direction = PVector.sub(target, position);
    float distance = direction.mag();

    if (distance < blackHoleSize / 2 + size / 2) {
      active = false;
      return;
    }

    direction.normalize();

    float speed = map(distance, 0, width, 2.5, 0.4);
    speed = constrain(speed, 0.4, 2.5);

    direction.mult(speed);
    velocity = direction;
    position.add(velocity);
  }

  void display() {
    if (!active) {
      return;
    }

    noStroke();
    fill(c);
    ellipse(position.x, position.y, size, size);
  }
}
