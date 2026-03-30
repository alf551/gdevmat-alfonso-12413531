class Walker
{
    float x;
    float y;

    void render()
    {
        float r = random(0, 255);
        float g = random(0, 255);
        float b = random(0, 255);
        float a = random(50, 101);

        noStroke();
        fill(r, g, b, a);
        circle(x, y, 30);
    }

    void randomWalk()
    {
        int rng = int(random(8));

        if (rng == 0) y++;
        else if (rng == 1) y--;
        else if (rng == 2) x++;
        else if (rng == 3) x--;
        else if (rng == 4) { x++; y++; }
        else if (rng == 5) { x--; y++; }
        else if (rng == 6) { x++; y--; }
        else if (rng == 7) { x--; y--; }
    }

    void randomWalkBiased()
    {
        float rng = random(1);

        if (rng < 0.40) x++;      
        else if (rng < 0.60) x--; 
        else if (rng < 0.80) y++; 
        else y--;                 
    }
}
