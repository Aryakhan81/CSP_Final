class SandGrain{
//  Random r = new Random();
  float grainRadius, coefficientOfFriction;
  
  //Constructor
  public void setMu(float coefficientOfFriction) {
    this.coefficientOfFriction = coefficientOfFriction;
  }
  
  public void setGrainRadius() {
    //Set grain radius based on this.coefficientOfFriction
  }
  public void create (){
    fill(100, 100, 0);
    //x and y are placeholders for random numbers
  //  ellipse(r.nextFloat, r.nextFloat, this.grainRadius, this.grainRadius);
  }
  public void update(){

    this.sandSize();
  }
  public void sandSize(){
    if (coefficientOfFriction <= 0.33 && coefficientOfFriction > 0){
      //clarity
      this.grainRadius *= 1;
      this.create();
    }
      else if(coefficientOfFriction > 0.33 && coefficientOfFriction <= 0.66){
        this.grainRadius *= 2;
        this.create();
      }
        else if(coefficientOfFriction > 0.66 && coefficientOfFriction <= 1){
          this.grainRadius *= 3;
          this.create();
        }
    }
}
