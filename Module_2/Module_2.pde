Walker myWalker = new Walker();
Walker biasedWalker = new Walker();

void setup()
{
    size(1020, 720, P3D);
    camera(0, 0, -(height/2.0) / tan(PI * 30.0 / 180.0), 0, 0, 0, 0, -1, 0);

    myWalker.x = width / 2;
    myWalker.y = height / 2;

    biasedWalker.x = width / 2;
    biasedWalker.y = height / 2;
}

void draw()
{
    myWalker.randomWalk();
    biasedWalker.randomWalkBiased();

    myWalker.render();
    biasedWalker.render();
}
