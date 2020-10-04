
Population pop;
PVector goal = new PVector(400, 10);
Obstacles walls;
Areas areas;

void setup() {
  size(800, 800);

  pop = new Population(1000);
  walls = new Obstacles(10);
  walls.init();

  areas = new Areas(28);
  areas.init();
}

void draw() {
  background(255);

  showGoal();
  walls.showWalls();
  areas.showAreas();

  if (pop.allDotsDead()) {
    // genetic algorithm
    pop.calculateFitness();
    pop.naturalSelection();
    pop.mutate();
  } else {

    pop.update();
    /*if (pop.dots[0].isBest && pop.minStep != 500)  // show best dot if it has reached the goal
      pop.dots[0].show();
    else*/
      pop.show();
  }
}

void showGoal() {
  fill(255, 0, 0);
  ellipse(goal.x, goal.y, 10, 10);
}
