class Population {
  Dot[] dots;
  float fitnessSum;
  int gen = 1;
  int bestDot;
  int minStep = 500;

  Population(int size) {
    dots = new Dot[size];

    for (int i = 0; i < size; i++) {
      dots[i] = new Dot();
    }
  }

  void show() {
    for (int i = 0; i< dots.length; i++) {
      dots[i].show();
    }
    dots[0].show();
  }

  void update() {
    for (int i = 0; i < dots.length; i++) {
      if (dots[i].brain.step > minStep) {
        dots[i].dead = true;
      } else {
        dots[i].update();
      }
    }
  }


  void calculateFitness() {
    for (int i = 0; i < dots.length; i++) {
      dots[i].calculateFitness();
    }
  }

  boolean allDotsDead() {
    for (int i = 0; i < dots.length; i++) {
      if (!dots[i].dead && !dots[i].reachedGoal) {
        return false;
      }
    }
    return true;
  }


  void naturalSelection() {
    Dot[] newDots = new Dot[dots.length]; 
    setBestDot();
    calculateFitnessSum();

    //newDots[0] = dots[bestDot].getBaby();
    newDots[0] = new Dot();
    newDots[0].brain = dots[bestDot].brain.clone();
    newDots[0].isBest = true;
    for (int i = 1; i < newDots.length; i++) {   
      // select parent based on fitness
      Dot parent = selectParent();
      // get baby from them
      newDots[i] = parent.getBaby();
    }
    dots = newDots.clone();
    gen++;
  }

  void calculateFitnessSum() {
    fitnessSum = 0;
    for (int i = 0; i < dots.length; i++) {
      fitnessSum += dots[i].fitness;
    }
  }


  Dot selectParent() {
    float rand = random(fitnessSum);

    float runningSum = 0;

    for (int i = 0; i < dots.length; i++) {
      runningSum += dots[i].fitness;
      if (runningSum > rand)
        return dots[i];
    }

    // shouldn't get here
    return null;
  }

  void mutate() {
    for (int i = 1; i < dots.length; i++) {
      dots[i].brain.mutate();
    }
  }

  void setBestDot() {
    double max = 0;
    int maxIndex = 0;
    for (int i = 0; i < dots.length; i++) {
      if (dots[i].fitness > max) {
        max = dots[i].fitness; 
        maxIndex = i;
      }
    }

    bestDot = maxIndex;
    if (dots[bestDot].reachedGoal) {
      minStep = dots[bestDot].brain.step;
      print("step:", minStep);
    }
    //dots[bestDot].fitness *= 10;
    print(" best fitness:", max);
    print(" best area:", dots[bestDot].brain.area);
    println(" gen:", gen);
  }
}
