class SandGrains{
//  Random r = new Random();
  float grainRadius = 5;
  float coefficientOfFriction;


  public void setMu(float coefficientOfFriction) {
    this.coefficientOfFriction = coefficientOfFriction;
  }

  public void create (){
    for (int i = 0; i < 10; i++)  {
      fill(RandomGenerator.randomFloat(50) + 100,RandomGenerator.randomFloat(50) + 100, 0);
      //varying shades of yellow for a bunch of same size sand grains
      ellipse(RandomGenerator.randomFloat(5) + 20 + (i*70), 300 - RandomGenerator.randomFloat(30), this.grainRadius, this.grainRadius);
  }
  }
  public void update(float coefficientOfFriction){
    this.coefficientOfFriction = coefficientOfFriction;
    this.grainSize();
  }
  public void grainSize(){
    if (coefficientOfFriction <= 0.33 && coefficientOfFriction > 0){
      //clarity
      grainRadius *= (1 * coefficientOfFriction);
      this.create();
    }
    else if(coefficientOfFriction > 0.33 && coefficientOfFriction <= 0.66){
      grainRadius *= (2 * coefficientOfFriction);
      this.create();
    }
    else if(coefficientOfFriction > 0.66 && coefficientOfFriction <= 1){
      grainRadius *= (3 * coefficientOfFriction);
      this.create();
    }
  }
}
