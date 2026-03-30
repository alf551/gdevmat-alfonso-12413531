Walker[] walkers;

void settings()
{
  size(Window.widthPx, Window.heightPx, P3D);
}

void setup()
{
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);

  walkers = new Walker[100];

  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i] = new Walker();
  }
}

void draw()
{
  background(0);

  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i].update();
    walkers[i].render();
    walkers[i].checkEdges();
  }
}
