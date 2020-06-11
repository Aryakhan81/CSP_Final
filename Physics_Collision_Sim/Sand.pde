class sandGrains{
//  Random r = new Random();
  float grainRadius = 5;
  float coefficientOfFriction;


  public void setMu(float coefficientOfFriction) {
    this.coefficientOfFriction = coefficientOfFriction;
  }

  public void create (){
    noStroke();
    for (int i = 0; i < 50; i++)  {
      fill(RandomGenerator.randomFloat(50) + 120,RandomGenerator.randomFloat(50) + 100, 0);
      //varying shades of yellow for a bunch of same size sand grains
      ellipse(RandomGenerator.randomFloat(5) + 20 + (i*15), 350 - RandomGenerator.randomFloat(10), grainRadius, grainRadius);
  }
  stroke(1);
  }
  public void update(){
    setMu(frictionSlider.currentValue);
    System.out.println(this.coefficientOfFriction + " coe");
    System.out.println(this.grainRadius + " rad");
    this.grainSize();
    this.create();
  }
  public void grainSize(){
    if (coefficientOfFriction <= 0.33 && coefficientOfFriction > 0){
      //clarity
      grainRadius = (50 * coefficientOfFriction);

    }
    //else if(coefficientOfFriction > 0.33 && coefficientOfFriction <= 0.66){
    //  grainRadius = (2 * coefficientOfFriction);

  //  }
    //else if(coefficientOfFriction > 0.66 && coefficientOfFriction <= 1){
    //  grainRadius = (3 * coefficientOfFriction);

    }
  }
