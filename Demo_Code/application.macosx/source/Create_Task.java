import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.Random; 
import java.util.Random; 
import java.util.Random; 
import java.util.Random; 
import java.util.Random; 
import java.util.Random; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Create_Task extends PApplet {



//Global variable container for current screen, initialized as the welcome screen 
public static Screen currentScreen = Screen.WELCOME;

//Global variables for the score and your lives
public static int score;
public static int lives;

//Buttons
Button playButton = new Button(325, 475, 150, 50, "Play!", Screen.GAME);
Button playAgainButton1 = new Button(325, 475, 150, 50, "Play Again!", Screen.GAME);
Button playAgainButton2 = new Button(305, 475, 150, 50, "Play Again!", Screen.GAME);

//Rocks
GoodRock rock1 = new GoodRock();
GoodRock rock2 = new GoodRock();
BadRock bad = new BadRock();

//Screen options
public enum Screen {
  WELCOME,
  GAME,
  WIN,
  LOSE
}

public void toWelcomeScreen() {
  background(200);
  
  //Print welcome and instruction text
  textSize(32);
  fill(0);
  text("Welcome to Stone Clicker!", 200, 200);
  textSize(16);
  text("The goal of this game is to click 25 grey stones without clicking on red stones or letting a stone hit the bottom or edges of the screen. The stones will fall with simulated gravitational effect. Good luck!", 200, 275, 400, 200);
  
  //Create the "play" button
  playButton.create(58, 31);
}

public void toLoseScreen() {
  
  //Change background color, display "You lose!"
  background(200, 50, 50);
  textSize(32);
  fill(0);
  text("You Lose!", 315, 200);
  
  //Create the "play again" button
  playAgainButton1.create(35, 31);
}

public void toWinScreen() {
  //Change background color, display "You lose!"
  background(50, 200, 50);
  textSize(32);
  fill(0);
  text("You Win!", 315, 200);
  
  //Create the "play again" button
  playAgainButton2.create(35, 31);
}

public void game() {
    background(200);
    
    //Text for number of lives and current
    fill(0);
    textSize(16);
    text("Score: " + score + "", 25, 25);
    text("Lives: " + lives + "", 25, 45);
    
    //Update the rocks' locations
    rock1.update();
    rock2.update();
    bad.update();
    
    //Check their bounds
    rock1.checkBounds();
    rock2.checkBounds();
    bad.checkBounds();
  
  if (score >= 25) {
    currentScreen = Screen.WIN;
  } else if (lives <= 0) {
    currentScreen = Screen.LOSE;
  }
}

public void settings() {
  size(800, 800);
}

public void draw() {
  
  //Do something depending on what screen is active
  switch(currentScreen) {
    case WELCOME:
      toWelcomeScreen();
      break;
    case GAME: 
      game();
      break;
    case LOSE:
      toLoseScreen();
      break;
    case WIN:
      toWinScreen();
      break;
  }
}

public void mouseClicked() {
  
  //Check for a different abject being clicked depending on what screen is active
  switch(currentScreen) {
    case WELCOME:
    
      //Check to see if the "play" button is clicked
      if(playButton.checkClick()) {
        
        currentScreen = playButton.switchToScreen;
        //Set the game play variables to original values
        score = 0;
        lives = 3;
      }
      break;
    case GAME:
    
      //Check to see if any of the rocks have been clicked
      rock1.checkClick();
      rock2.checkClick();
      bad.checkClick();
      break;
    case LOSE:
    
      //Check to see if the "play again" button is clicked
      if(playAgainButton1.checkClick()) {
        currentScreen = playAgainButton1.switchToScreen;
        
        //Set the game play variables to original values
        score = 0;
        lives = 3;
        
        //Reset Rock 1
        rock1.posX = RandomGenerator.randomInt(25, 775);
        rock1.posY = RandomGenerator.randomInt(25, 75);
        rock1.velX = 150 * (RandomGenerator.randomFloat() - RandomGenerator.randomFloat());
        rock1.velY = 150 * (RandomGenerator.randomFloat() - RandomGenerator.randomFloat());
        
        //Reset Rock 2
        rock1.posX = RandomGenerator.randomInt(25, 775);
        rock2.posY = RandomGenerator.randomInt(25, 75);
        rock2.velX = 150 * (RandomGenerator.randomFloat() - RandomGenerator.randomFloat());
        rock2.velY = 150 * (RandomGenerator.randomFloat() - RandomGenerator.randomFloat());
        
        //Reset Bad Rock
        bad.posX = RandomGenerator.randomInt(25, 775);
        bad.posY = RandomGenerator.randomInt(25, 75);
        bad.velX = 150 * (RandomGenerator.randomFloat() - RandomGenerator.randomFloat());
        bad.velY = 150 * (RandomGenerator.randomFloat() - RandomGenerator.randomFloat());
      }
      break;
    case WIN:
      
      //Check to see if the "play again" button is clicked
      if(playAgainButton2.checkClick()) {
        currentScreen = playAgainButton2.switchToScreen;
        
        //Set the game play variables to original values
        score = 0;
        lives = 3;
        
        //Reset Rock 1
        rock1.posX = RandomGenerator.randomInt(25, 775);
        rock1.posY = RandomGenerator.randomInt(25, 75);
        rock1.velX = 150 * (RandomGenerator.randomFloat() - RandomGenerator.randomFloat());
        rock1.velY = 150 * (RandomGenerator.randomFloat() - RandomGenerator.randomFloat());
        
        //Reset Rock 2
        rock1.posX = RandomGenerator.randomInt(25, 775);
        rock2.posY = RandomGenerator.randomInt(25, 75);
        rock2.velX = 150 * (RandomGenerator.randomFloat() - RandomGenerator.randomFloat());
        rock2.velY = 150 * (RandomGenerator.randomFloat() - RandomGenerator.randomFloat());
        
        //Reset Bad Rock
        bad.posX = RandomGenerator.randomInt(25, 775);
        bad.posY = RandomGenerator.randomInt(25, 75);
        bad.velX = 150 * (RandomGenerator.randomFloat() - RandomGenerator.randomFloat());
        bad.velY = 150 * (RandomGenerator.randomFloat() - RandomGenerator.randomFloat());
      }
      break;
  }
}


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


class Button {
  float x;
  float y;
  float width;
  float height;
  String text;
  Screen switchToScreen;
  
  //Button constructor
  public Button(float x, float y, float width, float height, String text, Screen switchToScreen) {
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    this.text = text;
    this.switchToScreen = switchToScreen;
  }
  
  //Method to draw the button
  public void create(float textX, float textY) {
    textSize(16);
    fill(255);
    rect(this.x, this.y, this.width, this.height, 12);
    fill(0);
    text(this.text, this.x + textX, this.y + textY);
  }
  
  //When the mouse is clicked, check to see if the cursor is in this button
  public boolean checkClick() {
    
    //Is the mouse in the x range?
    if (mouseX >= this.x && mouseX <= (this.x + this.width)) {
      
      //Is the mouse also in the y range?
      if (mouseY >= this.y && mouseY <= (this.y + this.height)) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

}


class GoodRock extends Rock {
  public GoodRock() {
    
    //Do all the stuff that regular rocks do
    super();
    
    //Also set the color values
    this.r = 100;
    this.g = 100;
    this.b = 100;
  }
  
  public void checkBounds() {
    
    //Make sure it's not at the edges or bottom
    if (this.posX <= 0 || this.posX >= 800 || this.posY >= 800) {
      lives--;
      
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
      score++;
      
      //Reset the position and velocity values
      this.posX = RandomGenerator.randomInt(25, 775);
      this.posY = RandomGenerator.randomInt(25, 75);
      this.velX = 150 * (RandomGenerator.randomFloat() - RandomGenerator.randomFloat());
      this.velY = 150 * (RandomGenerator.randomFloat() - RandomGenerator.randomFloat());
    }
  }
}


static class RandomGenerator {
  
  //Random float generator (between 0.0 - 1.0)
  public static float randomFloat(){
    Random r = new Random();
    return r.nextFloat();
  }
  
  //Random integer generator (between min and max)
  public static int randomInt(int min, int max) {
    Random r = new Random();
    return r.nextInt((max - min) + 1) + min;
  }
}


abstract class Rock {
  float posX, posY, velX, velY, accelX, accelY;
  int r, g, b;
  
  public Rock() {
    
    //Set the rock's position and velocity to random values and its acceleration to acceleration due to gravity
    this.posX = RandomGenerator.randomInt(25, 775);
    this.posY = RandomGenerator.randomInt(25, 75);
    this.velX = 150 * (RandomGenerator.randomFloat() - RandomGenerator.randomFloat());
    this.velY = 150 * (RandomGenerator.randomFloat() - RandomGenerator.randomFloat());
    this.accelX = 0;
    this.accelY = 9.81f;
  }
  
  //Method to update the rock's position
  public void update() {
    System.out.println(velY);
    
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
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Create_Task" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
