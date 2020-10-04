class Wall {
  int x, y, w, h;

  Wall() {
    x = 0;
    y = 0;
    w = 0;
    h = 0;
  }

  Wall(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  void show() {
    fill(0, 0, 255);
    //noFill();

    rect(x, y, w, h);
  }

  boolean inWall(PVector dot) {
    if ((dot.x >= x &&  dot.x <= x+w) && (dot.y >= y && dot.y <= y+h)) {
      return true;
    }
    return false;
  }
}
