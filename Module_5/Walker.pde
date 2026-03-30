class Walker
{
    PVector position;
    PVector speed;

    Walker()
    {
        position = new PVector(0, 0);
        speed = new PVector(5, 8);
    }

    void render()
    {
        fill(182, 52, 100);
        circle(position.x, position.y, 50);
    }

    void moveAndBounce()
    {
        position.add(speed);

        if (position.x > width/2 || position.x < -width/2)
        {
            speed.x *= -1;
        }

        if (position.y > height/2 || position.y < -height/2)
        {
            speed.y *= -1;
        }
    }
}
