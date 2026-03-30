float amplitude = 25;
float frequency = 0.07;
float t = 0;

float quadScale = 0.08;
float lineScale = 3.0;

void setup()
{
    size(1280, 720, P3D);
    camera(0, 0, -(height / 2.0) / tan(PI * 30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}

void draw()
{
    background(160);

    translate(width / 2, height / 2);

    drawAxes();
    plotQuadratic();
    plotLinear();
    plotWave();

    t += 0.08;
}

void drawAxes()
{
    stroke(120);
    strokeWeight(1);
    line(-width / 2, 0, width / 2, 0);
    line(0, -height / 2, 0, height / 2);
}

void plotQuadratic()
{
    fill(0, 255, 0);
    noStroke();

    for (float x = -120; x <= 220; x += 1)
    {
        float y = (x * x - 15 * x - 3) * quadScale;
        circle(x, -y, 4);
    }
}

void plotLinear()
{
    fill(150, 0, 200);
    noStroke();

    for (float x = -220; x <= 220; x += 2)
    {
        float y = (-5 * x + 30) / lineScale;
        circle(x, -y, 4);
    }
}

void plotWave()
{
    fill(0, 120, 255);
    noStroke();

    for (float x = -250; x <= 250; x += 2)
    {
        float y = amplitude * sin((x * frequency) + t);
        circle(x, -y, 4);
    }
}

void keyPressed()
{
    if (key == 'i' || key == 'I')
    {
        amplitude += 3;
    }

    if (key == 'k' || key == 'K')
    {
        amplitude -= 3;
    }

    if (key == 'l' || key == 'L')
    {
        frequency += 0.01;
    }

    if (key == 'j' || key == 'J')
    {
        frequency -= 0.01;
    }

    if (amplitude < 1)
    {
        amplitude = 1;
    }

    if (frequency < 0.01)
    {
        frequency = 0.01;
    }
}
