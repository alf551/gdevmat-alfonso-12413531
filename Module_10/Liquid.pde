public class Liquid
{
  public float x, y;
  public float horizon, depth;
  public float cd;

  public Liquid(float x, float y, float horizon, float depth, float cd)
  {
    this.x = x;
    this.y = y;
    this.horizon = horizon;
    this.depth = depth;
    this.cd = cd;
  }

  public void render()
  {
    fill(28, 120, 186);
    noStroke();
    beginShape();
    vertex(x - horizon, y + depth, 0);
    vertex(x + horizon, y + depth, 0);
    vertex(x + horizon, y, 0);
    vertex(x - horizon, y, 0);
    endShape(CLOSE);
  }

  public boolean isCollidingWith(Walker walker)
  {
    PVector pos = walker.position;

    return pos.x > x - horizon &&
           pos.x < x + horizon &&
           pos.y >= y &&
           pos.y <= y + depth;
  }

  public PVector calculateDragForce(Walker walker)
  {
    float speed = walker.velocity.mag();
    float dragMagnitude = cd * speed * speed;

    PVector dragForce = walker.velocity.copy();

    if (dragForce.mag() > 0)
    {
      dragForce.normalize();
      dragForce.mult(-dragMagnitude);
    }

    return dragForce;
  }
}
