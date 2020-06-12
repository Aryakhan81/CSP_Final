class Block {
  //here is where we should put the code for the block class, and all the data they contain
  //Definitely x, y initial velocity, current velocity, mass, etc. Not sure what else
  float velocity, mass, x, y, width, height, accelerationByFriction;
  float kineticEnergy, momentum;
  boolean shouldDraw = true;

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
  public void update(float coefficientOfFriction) {
    //Will call this.create()
    float friction = coefficientOfFriction * mass * g;
    this.accelerationByFriction = friction / mass;
    this.x += (1.6667 * this.velocity);

    //Determine which direction the friction should act
    if(this.velocity > 0.01) {
      this.velocity -= accelerationByFriction;
    } else if(this.velocity < -0.01) {
      this.velocity += accelerationByFriction;
    } else {
      this.velocity = 0;
    }

    //Set dynamics quantities
    this.kineticEnergy = 0.5 * this.mass * pow(this.velocity, 2);
    this.momentum = this.mass * this.velocity;

    if(this.shouldDraw) {
      this.create();
    }

  }

  //Give me the velocity. Should only be used on the action of the start button
  public void setInitialVelocity(float v) {
    this.velocity = v;
  }

  //Give me the mass. Should only be used on the action of the start button
  public void setMass(float m) {
    this.mass = m;
  }

  //Check to see if they have collided
  public boolean hasCollidedWith(Block collideWith) {
    if(this.x < collideWith.x && this.x + this.width >= collideWith.x) {
      return true;
    } else if(this.x > collideWith.x && this.x <= collideWith.x + collideWith.width) {
      return true;
    } else {
      return false;
    }
  }

  //Check to see if it has gone out of bounds
  public void checkBounds() {
    if(this.x < posX1 - this.width/2 || this.x > posX2 + this.width/2) {
      this.shouldDraw = false;
    } else {
      return;
    }
  }


}
