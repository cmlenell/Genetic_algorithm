class Dot {
  PVector pos;
  PVector vel;
  PVector acc;
  Brain brain;
  double fitness = 0;

  boolean dead = false;
  boolean reachedGoal = false;
  boolean isBest = false;


  Dot() {
    brain = new Brain(400);
    pos = new PVector(width/2, height-50);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
  }

  void show() {
    if (isBest) {
      fill(0, 255, 0);
      ellipse(pos.x, pos.y, 8, 8);
    } else if(!dead){
      fill(0);
      ellipse(pos.x, pos.y, 4, 4);
    }
  }


  void move() {
    if (brain.directions.length > brain.step) {
      acc = brain.directions[brain.step];
      brain.step++;
    } else {
      dead = true;
    }

    vel.add(acc);
    vel.limit(6);
    pos.add(vel);
  }


  void update() {
    if (!dead && !reachedGoal) {
      move();
      int area = areas.inAreas(pos);
      if (walls.inWalls(pos)) {
        dead = true;
      } else if (dist(pos.x, pos.y, goal.x, goal.y) < 5) {
        reachedGoal = true;
      } else if (pos.x < 2 || pos.y < 2 || pos.x > width-2 || pos.y > height-2) {
        dead = true;
      } 
      else if (area > brain.area) { // We reached a new area
        brain.area = area;
      } else if (area < brain.area ) { // we went backwards, stop the dot
        dead = true;
      }
    }
  }
  void calculateFitness() {
    if (reachedGoal) {
      fitness = pow(27, 3)*10 +(1/(brain.step/pow(13*10, 2))) * 10000.0;
    } else {
      //float distanceToGoal = dist(pos.x, pos.y, goal.x, goal.y);
      
      if (brain.area == 27) { // reached final area
        float distanceToGoal = dist(pos.x, pos.y, goal.x, goal.y);
        fitness = pow(27,3)*10 + (1.0/(distanceToGoal * distanceToGoal))*1000.0;
      } else {
        fitness = pow(brain.area,3)*10;//(brain.area * brain.area * brain.area)*10;
      }
    }
  }

  Dot getBaby() {
    Dot baby = new Dot();
    baby.brain = brain.clone();
    return baby;
  }
}
