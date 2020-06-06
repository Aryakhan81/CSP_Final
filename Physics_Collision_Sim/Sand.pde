class sandgrain{
//  Random r = new Random();
  float grainRadius;
  public void create (float grainRadius){
    fill(100, 100, 0);
    //x and y are placeholders for random numbers
    ellipse(r.nextFloat, r.nextFloat, this.grainRadius, this.grainRadius);
  }
  public void update(){

    this.sandSize();
  }
  public void sandSize(){
    if ((coefficientOfFriction =< 0.33)(coefficientOfFriction > 0)){
      //clarity
      this.grainRadius *= 1;
      this.create();
    }
      else if((coefficientOfFriction > 0.33)(coefficientOfFriction <= 0.66)){
        this.grainRadius *= 2;
        this.create();
      }
        else if((coefficientOfFriction > 0.66)(coefficientOfFriction <= 1)){
          this.grainRadius *= 3;
          this.create();
        }
    }
}
