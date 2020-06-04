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
Button startButton = new Button(525, 475, 150, 50, "Start!", Screen.SIMULATOR);
Button restartButton = new Button(1030, 730, 150, 50, "Start Over", Screen.SIMULATOR);

//two way Buttons
TwoWayButton elasticButton = new TwoWayButton(850, 200, 150, 50, "elastic", false);
TwoWayButton inelasticButton = new TwoWayButton(1000, 200, 150, 50, "inelastic", true);
//sliders


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
  text("Welcome to Physics CollisionSim!", 350, 200);
  textSize(16);
  text("Use the sliders to adjust the mass of each block, the coefficient of" +
  " friction, and the initial velocity of each block." +
  " Use the buttons to toggle between elastic and inelastic for the collision." +
  " Press the start button to begin. Have Fun!", 200, 275, 900, 200);

  //Create the "start" button
  startButton.create(58, 31);
}

void simulator() {
  background(200);
  restartButton.create(38, 31);
  //this is where the design for the simulator screen should go
  elasticButton.create(53, 31);
  inelasticButton.create(45, 31);
  elasticButton.setPartner(inelasticButton);
  inelasticButton.setPartner(elasticButton);
}

void settings() {
  //Decide on screen size here
  size(1200, 800);
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
      if(restartButton.checkClick()) {
        currentScreen = restartButton.switchToScreen;
        //here is where we might want to reset the physics values to default
      }
      //here is where we update which is the clicked button in the two-way button
      elasticButton.updateClickStatus();
      inelasticButton.updateClickStatus();
      break;
  }
}

void mouseDragged() {
  //Code for the sliders
}
