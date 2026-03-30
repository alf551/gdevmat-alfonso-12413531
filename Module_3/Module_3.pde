void setup()
{
  size(1020, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  background(0);
}

void draw()
{
  float gx = randomGaussian();
  float x = gx * 200;

  float y = random(-height/2, height/2);

  float gs = randomGaussian();
  float s = abs(20 + gs * 10);

  float r = random(0, 255);
  float g = random(0, 255);
  float b = random(0, 255);
  float a = random(10, 101);

  noStroke();
  fill(r, g, b, a);
  circle(x, y, s);

  if (frameCount % 300 == 0)
  {
    background(0);
  }
}
