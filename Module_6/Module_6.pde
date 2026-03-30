void setup()
{
    camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
    size(1080, 720, P3D);
}

PVector mousePos()
{
    float x = mouseX - Window.windowWidth;
    float y = -(mouseY - Window.windowHeight);
    return new PVector(x, y);
}

void draw()
{
    background(130);

    PVector mouse = mousePos();
    mouse.normalize().mult(500);

    strokeCap(ROUND);


    stroke(255, 0, 0);
    strokeWeight(20);
    line(0, 0, mouse.x, mouse.y);
    line(0, 0, -mouse.x, -mouse.y);

    stroke(255);
    strokeWeight(6);
    line(0, 0, mouse.x, mouse.y);
    line(0, 0, -mouse.x, -mouse.y);


    PVector dir = mouse.copy().normalize();
    PVector h1 = PVector.mult(dir, -60);
    PVector h2 = PVector.mult(dir, 60);

    stroke(0);
    strokeWeight(20);
    line(h1.x, h1.y, h2.x, h2.y);

    println(mouse.mag());
}
