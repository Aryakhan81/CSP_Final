import java.util.Random;

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

void toWelcomeScreen() {
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

void toLoseScreen() {
  
  //Change background color, display "You lose!"
  background(200, 50, 50);
  textSize(32);
  fill(0);
  text("You Lose!", 315, 200);
  
  //Create the "play again" button
  playAgainButton1.create(35, 31);
}

void toWinScreen() {
  //Change background color, display "You lose!"
  background(50, 200, 50);
  textSize(32);
  fill(0);
  text("You Win!", 315, 200);
  
  //Create the "play again" button
  playAgainButton2.create(35, 31);
}

void game() {
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

void settings() {
  size(800, 800);
}

void draw() {
  
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

void mouseClicked() {
  
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
