class Block {
  //here is where we should put the code for the block class, and all the data they contain
  //Definitely x, y initial velocity, current velocity, mass, etc. Not sure what else
  float velocity, mass, x, y, width, height, momentum, friction, acceleration_by_friction, coefficient_of_friction;

  public Block(float x, float y) {
    this.x = x;
    this.y = y;
    this.width = this.height = 50;
  }

  //Create the image of the block
  public void create() {
    fill(20, 20, 200);
    rect(this.x, this.y, this.width, this.height);
  }

  //Update the block's kinematic quantities
  public void update(float coefficient_of_friction) {
    //Will call this.create()
    float momentum = velocity * mass;
    float friction = coefficient_of_friction * mass * g;
    this.acceleration_by_friction = friction / mass;
    this.create();
  }

  //Check to see if they have collided
  public boolean hasCollided(Block collideWith) {
    if(this.x < collideWith.x && this.x + this.width >= collideWith.x) {
      return true;
    } else if(this.x > collideWith.x && this.x <= collideWith.x + collideWith.width) {
      return true;
    } else {
      return false;
    }
  }
}
