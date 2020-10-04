class Area {
  int x, y, w, h, id;

  Area() {
    x = 0;
    y = 0;
    w = 0;
    h = 0;
  }

  Area(int id, int x, int y, int w, int h) {
    this.id = id;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  void show() {
    //fill(0, 0, 255);
    noFill();

    rect(x, y, w, h);
  }


  int inArea(PVector dot) {
    if ((dot.x >= x &&  dot.x <= x+w) && (dot.y >= y && dot.y <= y+h)) {
      return id;
    }
    return -1; // not in the area
  }
}
