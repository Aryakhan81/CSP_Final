class SandGrains{
//  Random r = new Random();
  float grainRadius, coefficientOfFriction;
  grainRadius = 5;
  //Constructor
  public void setMu(float coefficientOfFriction) {
    this.coefficientOfFriction = coefficientOfFriction;
  }

  public void setGrainRadius() {
    //Set grain radius based on this.coefficientOfFriction
  }
  public void create (){
    for (int i = 0; i < 10; i + 1)  {
      fill(RandomGenerator.randomFloat(50) + 100,RandomGenerator.randomFloat(50) + 100, 0);
      //x and y are placeholders for random numbers
      ellipse(RandomGenerator.randomFloat(5) + 20 + (i*70), 300 - RandomGenerator.randomFloat(30), this.grainRadius, this.grainRadius);
  }
  }
  public void update(){

    this.grainSize();
  }
  public void grainSize(){
    if (coefficientOfFriction <= 0.33 && coefficientOfFriction > 0){
      //clarity
      this.grainRadius *= (1 * coefficientOfFriction);
      this.create();
    }
    else if(coefficientOfFriction > 0.33 && coefficientOfFriction <= 0.66){
      this.grainRadius *= (2 * coefficientOfFriction);
      this.create();
    }
    else if(coefficientOfFriction > 0.66 && coefficientOfFriction <= 1){
      this.grainRadius *= (3 * coefficientOfFriction);
      this.create();
    }
    }
}
