class Block {
  //here is where we should put the code for the block class, and all the data they contain
  //Definitely x, y initial velocity, current velocity, mass, etc. Not sure what else
  float velocity, mass, x, y, width, height, accelerationByFriction;
  float kineticEnergy, momentum;
  float absoluteVelocity;
  float hexColor;
  boolean shouldDraw = true;

  public Block(float x, float y, String hex) {
    this.x = x;
    this.y = y;
    this.width = this.height = 50;

    //Start at default colors
    this.hexColor = unhex(hex);
  }

  //Create the image of the block
  public void create() {
    // fill(20, 20, 200);
    fill(this.hexColor);
    rect(this.x, this.y, this.width, this.height);
  }
  //bandage solution to blocks not resetting color
  // public void createOriginal() {
  //   fill(20, 20, 200);
  //   rect(this.x, this.y, this.width, this.height);
  // }

  //Update the block's kinematic quantities
  public void update(float coefficientOfFriction) {
    //Will call this.create()

    if(this.shouldDraw) {

      //Update kinematic quantities
      float friction = coefficientOfFriction * mass * g;
      this.accelerationByFriction = friction / mass;
      this.x += (1.6667 * this.velocity);

      //Determine which direction the friction should act
      if(this.velocity > 0.15) {
        this.velocity -= accelerationByFriction;
        // System.out.println("if");
      } else if(this.velocity < -0.15) {
        this.velocity += accelerationByFriction;
        // System.out.println("elseif");
      } else if((this.velocity < 0.15)&&(this.velocity > -0.15))
      {
        // System.out.println("else");
        this.velocity = 0;
        this.accelerationByFriction = 0;
      }

      //Set dynamics quantities
      this.kineticEnergy = 0.5 * this.mass * pow(this.velocity, 2);
      this.momentum = this.mass * this.velocity;
      //this.colorChange();
      this.create();
    }
  }
    //old colorshifter do not use
  //checks if velocity is positve or Negative and stores its absolute value in a variable
  // public void colorChange(){
  //   if(this.velocity < -0.01){
  //     absoluteVelocity = this.velocity*-1;
  //   }
  //   else if (this.velocity > 0.01){
  //     absoluteVelocity = this.velocity;
  //   }
  //   else {
  //     absoluteVelocity = 0;
  //   }
  //
  //   if(absoluteVelocity < 0.01) {
  //     this.resetColor();
  //   }
  //   else if((absoluteVelocity > 0.01) && (absoluteVelocity < 1)){
  //     red = -20;
  //     green = -20;
  //     blue =55;
  //     //blue
  //   }
  //   else if(absoluteVelocity >= 1 && absoluteVelocity <2){
  //     red =-20;
  //     green =107.5;
  //     blue =55;
  //     //green blue
  //   }
  //   else if(absoluteVelocity >= 2 && absoluteVelocity <3){
  //     red =-20;
  //     green =235;
  //     blue =55;
  //     //cyan
  //   }
  //   else if(absoluteVelocity >= 3 && absoluteVelocity <4){
  //     red =-20;
  //     green =235;
  //     blue =-72.5;
  //     //blue green
  //   }
  //   else if(absoluteVelocity >= 4 && absoluteVelocity <5){
  //     red =-20;
  //     green =235;
  //     blue =-200;
  //     //green
  //   }
  //   else if(absoluteVelocity >= 5 && absoluteVelocity <6){
  //     red =107.5;
  //     green =235;
  //     blue =-200;
  //     //yellow green
  //   }
  //   else if(absoluteVelocity >= 6 && absoluteVelocity <7){
  //     red =235;
  //     green =235;
  //     blue =-200;
  //     //yellow
  //   }
  //   else if(absoluteVelocity >= 7 && absoluteVelocity <8){
  //     red =235;
  //     green =107.5;
  //     blue =-200;
  //     //orange
  //   }
  //   else if(absoluteVelocity >= 8 && absoluteVelocity <10){
  //     red =235;
  //     green =-20;
  //     blue =-200;
  //     //red
  //   }
  // }

  //Reset color to the default value
  //private void resetColor() {
    //this.red = 0;
    //this.blue = 0;
    //this.green = 0;
  //}

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
    if(this.x < posX1 - this.width/2 - 5.5 || this.x > posX2 + this.width/2) {
      this.shouldDraw = false;
    } else {
      return;
    }
  }


}
