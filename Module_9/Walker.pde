class Walker
{
  PVector position;
  PVector velocity;
  PVector acceleration;
  float mass;
  float scale;
  color c;

  Walker(PVector startPos, float m)
  {
    position = startPos.copy();
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    mass = m;
    scale = mass * 7;
    c = color(random(60, 255), random(60, 255), random(60, 255), 180);
  }

  void applyForce(PVector force)
  {
    PVector f = force.copy();
    f.div(mass);
    acceleration.add(f);
  }

  void update()
  {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
  }

  void checkEdges()
  {
    float r = scale / 2.0;

    if (position.x < Window.left + r)
    {
      position.x = Window.left + r;
      velocity.x = 0;
    }

    if (position.x > Window.right - r)
    {
      position.x = Window.right - r;
      velocity.x = 0;
    }

    if (position.y < -Window.windowHeight + r)
    {
      position.y = -Window.windowHeight + r;
      velocity.y = 0;
    }

    if (position.y > Window.windowHeight - r)
    {
      position.y = Window.windowHeight - r;
      velocity.y = 0;
    }
  }

  void display()
  {
    noStroke();
    fill(c);
    ellipse(position.x, position.y, scale, scale);
  }
}
