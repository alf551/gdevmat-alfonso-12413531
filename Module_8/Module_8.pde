Walker[] walkers;
PVector gravity = new PVector(0, 0.4);
PVector wind = new PVector(0.15, 0);

void settings()
{
  size(Window.widthPx, Window.heightPx, P3D);
}

void setup()
{
  walkers = new Walker[10];
  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i] = new Walker(i + 1);
  }
}

void draw()
{
  background(80);
  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i].applyForce(gravity);
    walkers[i].applyForce(wind);
    walkers[i].update();
    walkers[i].checkEdges();
    walkers[i].render();
  }
}
