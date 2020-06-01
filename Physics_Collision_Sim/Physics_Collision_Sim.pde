/**
//TODO:
-----------
-> Enumeration for the screen names
-> Classes for Buttons, Sliders and Two-Way Buttons
-> Functions setting the screen upon each screen transition
-> setup(), draw() and mouseClicked()
**/

//global variable that shows the current screen
public static Screen currentScreen = Screen.WELCOME;

//buttons
Button startButton = new Button(325, 475, 150, 50, "Start!", Screen.SIMULATOR);
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
  text("Welcome to Physics CollisionSim!", 200, 200);
  textSize(16);
  text("Use the sliders to adjust the mass of each blcok, the coefficient of friction, and the initial velocity of each block." +
  " Use the buttons to toggle between elastic and inelastic for the collision." +
  " Press the start button to begin. Have Fun!", 200, 275, 400, 200);

  //Create the "start" button
  startButton.create(58, 31);
}

void settings() {
  //Decide on screen size here
  size(800, 800);
}

void draw() {
  //Do something depending on which screen is active
  switch(currentScreen) {
    case WELCOME:
      toWelcomeScreen();
      break;
    case SIMULATOR:
      simulator();
  }
}

void mouseClicked() {
  //This is where we put the "if clicked" code for the buttons,
}
