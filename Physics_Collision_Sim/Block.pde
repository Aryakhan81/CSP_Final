class Block {
  //here is where we should put the code for the block class, and all the data they contain
  //Definitely x, y initial velocity, current velocity, mass, etc. Not sure what else
  float velocity, mass, momentum, x, y, width, height;
  float gravity = 9.8;
// mass1 * velocity1 = velocity2 * mass2 = momentum
// calculate without friction first
  
  public Block(float velocity, float mass, float x, float y) {
    this.velocity = velocity;
    this.mass = mass;
    this.momentum = mass * velocity;
    this.x = x;
    this.y = y;
    this.width = this.height = 50;
  }
  private void checkCollision(Block collideWith) {

  }
}
