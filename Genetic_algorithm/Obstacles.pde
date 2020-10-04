class Obstacles {
  Wall[] walls;

  Obstacles(int size) {
    walls = new Wall[size];

    for (int i = 0; i < size; i++) {
      walls[i] = new Wall();
    }
  }

  void init() {
    walls[0] = new Wall(550, 700, 10, 100);
    walls[1] = new Wall(350, 700, 200, 10);
    walls[2] = new Wall(350, 600, 10, 100);
    walls[3] = new Wall(250, 500, 10, 400);
    walls[4] = new Wall(250, 500, 300, 10);
    walls[5] = new Wall(350, 600, 310, 10);
    walls[6] = new Wall(650, 0, 10, 610);
    walls[7] = new Wall(550, 100, 10, 410);
    walls[8] = new Wall(350, 100, 200, 10);
    walls[9] = new Wall(350, 0, 10, 110);
  }

  void showWalls() {
    for (int i = 0; i < walls.length; i++) {
      walls[i].show();
    }
  }

  boolean inWalls(PVector dot) {
    for (int i = 0; i < walls.length; i++) {
      if ( walls[i].inWall(dot))
        return true;
    }
    return false;
  }
}
