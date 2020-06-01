import java.util.Random;

abstract class Rock {
  float posX, posY, velX, velY, accelX, accelY;
  int r, g, b;
  
  public Rock() {
    
    //Set the rock's position and velocity to random values and its acceleration to acceleration due to gravity
    this.posX = RandomGenerator.randomInt(25, 775);
    this.posY = RandomGenerator.randomInt(25, 75);
    this.velX = 50 * (RandomGenerator.randomFloat() - RandomGenerator.randomFloat());
    this.velY = 50 * (RandomGenerator.randomFloat() - RandomGenerator.randomFloat());
    this.accelX = 0;
    this.accelY = 9.81;
  }
  
  //Method to update the rock's position
  public void update() {
    
    //Draw the circle that represents the rock
    fill(r, g, b);
    circle(posX, posY, 25);
    
    //Update its kinematic quantities for the next round
    this.posX += velX/frameRate;
    this.posY += velY/frameRate;
    this.velX += accelX/frameRate;
    this.velY += accelY/frameRate;
  }
  
  //Check to see if it's still in the arena
  public abstract void checkBounds();
  
  //Check to see if it's been clicked yet
  public abstract void checkClick();
  
}
