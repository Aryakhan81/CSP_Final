/**
//TODO:
-----------
-> Enumeration for the screen names - DONE
-> Classes for Buttons, Sliders and Two-Way Buttons
-> Functions setting the screen upon each screen transition
-> setup(), draw() and mouseClicked()
**/

//global variable that shows the current screen
public static Screen currentScreen = Screen.WELCOME;

//buttons
Button startButton = new Button(650, 475, 150, 50, "Start!", Screen.SIMULATOR);
Button restartButton = new Button(325, 475, 150, 50, "Start Over", Screen.SIMULATOR);

//Screen options
public enum Screen {
  //What screens do we want to have?
  WELCOME,
  SIMULATOR
  //do we want to have a data screen where the velocities etc are displayed after the collision?
  //maybe add graphs?
}

void toWelcomeScreen() {
  background(200);

  //print welcome and instruction text
  textSize(32);
  fill(0);
  text("Welcome to Physics CollisionSim!", 475, 200);
  textSize(16);
  text("Use the sliders to adjust the mass of each block, the coefficient of friction, and the initial velocity of each block." +
  " Use the buttons to toggle between elastic and inelastic for the collision." +
  " Press the start button to begin. Have Fun!", 200, 275, 1100, 200);

  //Create the "start" button
  startButton.create(58, 31);
}

void simulator() {
  //this is where the code for the simulator goes
}

void settings() {
  //Decide on screen size here
  size(1500, 1000);
}

void draw() {
  //Do something depending on which screen is active
  switch(currentScreen) {
    case WELCOME:
      toWelcomeScreen();
      break;
    case SIMULATOR:
      simulator();
      break;
  }
}

void mouseClicked() {
  //This is where we put the "if clicked" code for the buttons,
  //Check for a different object being clicked based on the active screen
  switch(currentScreen) {
    case WELCOME:
      //check if the "start" button is clicked
      if(startButton.checkClick()) {
        currentScreen = startButton.switchToScreen;
        //here is where we might want to reset the physics values to default
      }
      break;
    case SIMULATOR:
      //here is where we put the code for the buttons inside the simulator
      //here is where we might want to reset the physics values to default
  }
}
