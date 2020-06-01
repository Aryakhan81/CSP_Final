import java.util.Random;

class BadRock extends Rock {
  public BadRock() {
    
    //Do all the stuff that regular rocks do
    super();
    
    //Also set the color values
    this.r = 200;
    this.g = 50;
    this.b = 50;
  }
  
  public void checkBounds() {
    
    //Make sure it's not at the edges or bottom
    if (this.posX <= 0 || this.posX >= 800 || this.posY >= 800) {
      
      //Reset the position and velocity values
      this.posX = RandomGenerator.randomInt(25, 775);
      this.posY = RandomGenerator.randomInt(25, 75);
      this.velX = 2 * (RandomGenerator.randomFloat() - RandomGenerator.randomFloat());
      this.velY = RandomGenerator.randomFloat() - RandomGenerator.randomFloat();
    }
    
  }
  
  public void checkClick() {
    
    //Set up position vectors for the center of the rock and the mouse
    PVector position = new PVector(this.posX, this.posY);
    PVector mousePosition = new PVector(mouseX, mouseY);
    float dist = PVector.dist(position, mousePosition);
    
    if (dist <= 25) {
      lives--;
      
      //Reset the position and velocity values
      this.posX = RandomGenerator.randomInt(25, 775);
      this.posY = RandomGenerator.randomInt(25, 75);
      this.velX = 150 * (RandomGenerator.randomFloat() - RandomGenerator.randomFloat());
      this.velY = 150 * (RandomGenerator.randomFloat() - RandomGenerator.randomFloat());
    }
  }
}
