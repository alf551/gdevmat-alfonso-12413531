Liquid ocean = new Liquid(0, -360, Window.right, 220, 0.1f);
Walker[] walkers = new Walker[10];

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  float spacing = (Window.right - Window.left) / 11.0f;
  for (int i = 0; i < 10; i++)
  {
    float mass = map(i, 0, 9, 6, 1);
    walkers[i] = new Walker();
    walkers[i].position = new PVector(Window.left + spacing * (i + 1), Window.top + 50);
    walkers[i].mass = mass;
    walkers[i].scale = mass * 16;
    walkers[i].r = random(255);
    walkers[i].g = random(255);
    walkers[i].b = random(255);
  }
}

void draw()
{
  background(255);
  ocean.render();
  for (int i = 0; i < 10; i++)
  {
    Walker w = walkers[i];

    PVector gravity = new PVector(0, -0.15f * w.mass);
    w.applyForce(gravity);

    PVector wind = new PVector(0.1f, 0);
    w.applyForce(wind);

    if (ocean.isCollidingWith(w))
    {
      PVector dragForce = ocean.calculateDragForce(w);
      w.applyForce(dragForce);
    }

    w.update();


    for (int j = i + 1; j < 10; j++)
    {
      Walker other = walkers[j];
      PVector diff = PVector.sub(w.position, other.position);
      float distance = diff.mag();
      float minDist = (w.scale / 2) + (other.scale / 2);

      if (distance < minDist && distance > 0)
      {
        PVector push = diff.normalize().mult((minDist - distance) / 2);
        w.position.add(push);
        other.position.sub(push);

        PVector axis = diff.normalize();
        float v1 = PVector.dot(w.velocity, axis);
        float v2 = PVector.dot(other.velocity, axis);
        w.velocity.add(axis.copy().mult(v2 - v1));
        other.velocity.add(axis.copy().mult(v1 - v2));
      }
    }

    if (w.position.y - w.scale / 2 <= Window.bottom)
    {
      w.position.y = Window.bottom + w.scale / 2;
      w.velocity.y *= -1;
      w.velocity.x *= 0.2f;
      if (abs(w.velocity.x) < 0.05f)
      {
        w.velocity.x = 0;
      }
    }

    if (w.position.x - w.scale / 2 <= Window.left)
    {
      w.position.x = Window.left + w.scale / 2;
      w.velocity.x = 0;
    }

    if (w.position.x + w.scale / 2 >= Window.right)
    {
      w.position.x = Window.right - w.scale / 2;
      w.velocity.x = 0;
    }

    w.render();
  }
}
