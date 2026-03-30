public class Walker
{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();

  public float velocityLimit = 10;
  public float scale = 15;
  public float mass = 1;

  public float r = 255, g = 255, b = 255, a = 255;

  public void applyForce(PVector force)
  {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  public void update()
  {
    velocity.add(acceleration);
    velocity.limit(velocityLimit);
    position.add(velocity);
    acceleration.mult(0);
  }

  public void render()
  {
    fill(r, g, b, a);
    stroke(0);
    circle(position.x, position.y, scale);
  }
}
