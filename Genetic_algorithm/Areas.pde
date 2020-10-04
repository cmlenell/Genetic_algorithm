class Areas {
  Area[] areas;

  Areas(int size) {
    areas = new Area[size];

    for (int i = 0; i < size; i++) {
      areas[i] = new Area();
    }
  }

  void init() {

    areas[0] = new Area(0, 350, 711, 199, 100);
    areas[1] = new Area(1, 260, 756, 90, 45);
    areas[2] = new Area(2, 260, 711, 90, 45);
    areas[3] = new Area(3, 260, 655, 90, 55);
    areas[4] = new Area(4, 260, 600, 90, 55);
    areas[5] = new Area(5, 260, 510, 45, 90);
    areas[6] = new Area(6, 305, 510, 45, 90);
    areas[7] = new Area(7, 350, 510, 50, 90);
    areas[8] = new Area(8, 400, 510, 50, 90);
    areas[9] = new Area(9, 450, 510, 50, 90);
    areas[10] = new Area(10, 500, 510, 60, 90);
    areas[11] = new Area(11, 560, 555, 90, 45);
    areas[12] = new Area(12, 560, 510, 90, 45);
    areas[13] = new Area(13, 560, 460, 90, 50);
    areas[14] = new Area(14, 560, 410, 90, 50);
    areas[15] = new Area(15, 560, 360, 90, 50);
    areas[16] = new Area(16, 560, 310, 90, 50);
    areas[17] = new Area(17, 560, 260, 90, 50);
    areas[18] = new Area(18, 560, 260, 90, 50);
    areas[19] = new Area(19, 560, 210, 90, 50);
    areas[20] = new Area(20, 560, 160, 90, 50);
    areas[21] = new Area(21, 560, 100, 90, 60);
    areas[22] = new Area(22, 605, 0, 45, 100);
    areas[23] = new Area(23, 560, 0, 45, 100);
    areas[24] = new Area(24, 510, 0, 50, 100);
    areas[25] = new Area(25, 460, 0, 50, 110);
    areas[26] = new Area(26, 360, 50, 100, 50);
    areas[27] = new Area(27, 360, 0, 100, 50);
  }

  void showAreas() {
    for (int i = 0; i < areas.length; i++) {
      areas[i].show();
    }
  }

  int inAreas(PVector dot) {
    int area = -1;
    for (int i = 0; i < areas.length; i++) {
      if ( (area = areas[i].inArea(dot)) != -1 )
        return area;
    }
    return area;  // will return -1 if reached
  }
}
