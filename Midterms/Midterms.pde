BlackHole blackHole;
Matter[] matters;

int matterCount = 120;
int resetFrames = 600;
int timer = 0;

void setup() {
  size(800, 600);
  initializeSimulation();
}

void draw() {
  background(0);

  blackHole.update();
  blackHole.display();

  for (int i = 0; i < matters.length; i++) {
    if (matters[i].active) {
      matters[i].moveTowards(blackHole.position, blackHole.size);
      matters[i].display();
    }
  }

  timer++;

  if (timer >= resetFrames) {
    initializeSimulation();
  }
}

void initializeSimulation() {
  blackHole = new BlackHole();

  matters = new Matter[matterCount];
  for (int i = 0; i < matters.length; i++) {
    matters[i] = new Matter();
  }

  timer = 0;
}
