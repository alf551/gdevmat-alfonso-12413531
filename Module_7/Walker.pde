public class Walker
{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();

  public float velocityLimit = 10;
  public float scale;

  public Walker()
  {
    position = new PVector(
      random(Window.left, Window.right),
      random(Window.bottom, Window.top)
    );

    scale = random(10, 40);
  }

  public void update()
  {
    PVector mouse = new PVector(
      mouseX - width / 2,
      mouseY - height / 2
    );

    PVector direction = PVector.sub(mouse, position);
    direction.normalize();
    direction.mult(0.2);

    acceleration = direction;
    velocity.add(acceleration);
    velocity.limit(velocityLimit);
    position.add(velocity);
  }

  public void render()
  {
    pushMatrix();
    translate(width / 2, height / 2);
    fill(255);
    noStroke();
    circle(position.x, position.y, scale);
    popMatrix();
  }

  public void checkEdges()
  {
    if (position.x > Window.right) position.x = Window.left;
    else if (position.x < Window.left) position.x = Window.right;

    if (position.y > Window.top) position.y = Window.bottom;
    else if (position.y < Window.bottom) position.y = Window.top;
  }
}
