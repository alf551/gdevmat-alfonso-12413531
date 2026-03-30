Walker[] walkers;
int walkerCount = 8;

void settings()
{
  size(Window.widthPx, Window.heightPx);
}

void setup()
{
  resetWalkers();
}

void draw()
{
  background(245);
  translate(width / 2, height / 2);

  stroke(90);
  strokeWeight(3);
  line(0, -Window.windowHeight, 0, Window.windowHeight);

  for (int i = 0; i < walkers.length; i++)
  {
    Walker w = walkers[i];

    PVector accel = new PVector(0.2, 0);
    w.applyForce(accel);

    if (w.velocity.mag() > 0)
    {
      float mu = 0.02;

      if (w.position.x > 0)
      {
        mu = 0.40; //adjust to higher value to test friction
      }

      PVector friction = w.velocity.copy();
      friction.normalize();
      friction.mult(-1);
      friction.mult(mu);

      w.applyForce(friction);
    }

    w.update();
    w.checkEdges();
    w.display();
  }
}

void mousePressed()
{
  resetWalkers();
}

void resetWalkers()
{
  walkers = new Walker[walkerCount];

  for (int i = 0; i < walkerCount; i++)
  {
    float posY = 2 * (Window.windowHeight / (float)walkerCount) * (i - (walkerCount / 2.0));

    walkers[i] = new Walker(
      new PVector(Window.left + 70, posY),
      i + 1
    );
  }
}
