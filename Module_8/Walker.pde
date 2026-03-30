public class Walker
{
  public PVector position;
  public PVector velocity;
  public PVector acceleration;
  public float mass;
  public float scale;
  public color c;

  public Walker(float mass)
  {
    this.mass = mass;
    this.scale = mass * 15;
    position = new PVector(0, height / 2);
    velocity = new PVector();
    acceleration = new PVector();
    c = color(random(255), random(255), random(255), 160);
  }

  public void applyForce(PVector force)
  {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  public void update()
  {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
  }

  public void render()
  {
    noStroke();
    fill(c);
    circle(position.x, position.y, scale);
  }

  public void checkEdges()
  {
    float r = scale / 2.0;

    if (position.x + r > width)
    {
      position.x = width - r;
      velocity.x *= -1;
    }
    else if (position.x - r < 0)
    {
      position.x = r;
      velocity.x *= -1;
    }

    if (position.y + r > height)
    {
      position.y = height - r;
      velocity.y *= -1;
    }
    else if (position.y - r < 0)
    {
      position.y = r;
      velocity.y *= -1;
    }
  }
}
