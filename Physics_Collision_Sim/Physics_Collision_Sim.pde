/**
//TODO:
-----------
-> Enumeration for the screen names - DONE
-> Classes for Buttons, Sliders and Two-Way Buttons - DONE
-> Functions setting the screen upon each screen transition
-> setup(), draw() and mouseClicked()
-> Functions for elastic and inelastic collisions
**/

//global variable that shows the current screen
public static Screen currentScreen = Screen.WELCOME;

//buttons
Button startButton = new Button(525, 475, 150, 50, "Start!", Screen.SIMULATOR);
Button restartButton = new Button(1030, 730, 150, 50, "Start Over");
Button startSimButton = new Button(500, 700, 150, 50, "Start!");

//two way Buttons
TwoWayButton elasticButton = new TwoWayButton(850, 200, 150, 50, "elastic", false);
TwoWayButton inelasticButton = new TwoWayButton(1000, 200, 150, 50, "inelastic", true);

//sliders
Slider frictionSlider = new Slider(862, 350, 0, 1);
Slider initialVelocity1Slider = new Slider(862, 450, 0, 10);
Slider initialVelocity2Slider = new Slider(862, 550, 0, -10);

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
  //create the start and restart buttons
  restartButton.create(38, 31);
  startSimButton.create(58, 31);
  //this is where the design for the simulator screen should go
  //creates the two-way buttons and assigns them as partners
  elasticButton.create(53, 31);
  inelasticButton.create(45, 31);
  elasticButton.setPartner(inelasticButton);
  inelasticButton.setPartner(elasticButton);
  //creates the sliders
  frictionSlider.create(0, 35);
  initialVelocity1Slider.create(0, 35);
  initialVelocity2Slider.create(0, 35);
  //creates the titles for the Sliders
  fill(0);
  text("Coefficient of friction", 862, 335);
  text("Initial velocity of block 1", 862, 435);
  text("Initial velocity of block 2", 862, 535);
  //update the current value of the sliders
  frictionSlider.updateCurrentValue();
  initialVelocity1Slider.updateCurrentValue();
  initialVelocity2Slider.updateCurrentValue();
  //create a text area that displays the current value of each slider
  text(frictionSlider.currentValue, 1000, 350);
  text(initialVelocity1Slider.currentValue, 1000, 450);
  text(initialVelocity2Slider.currentValue, 1000, 550);
  //Draw out the area for the blocks to move on

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
        //here is where we might want to reset the physics values to default
        //set the elastic/inelastic back to default
        elasticButton.isClicked = false;
        inelasticButton.isClicked = true;
        //sets the friction back to default
        frictionSlider.x = frictionSlider.lineX;
        frictionSlider.updateCurrentValue();
        //sets the initial velocities back to default
        initialVelocity1Slider.x = initialVelocity1Slider.lineX;
        initialVelocity2Slider.x = initialVelocity2Slider.lineX;
        initialVelocity1Slider.updateCurrentValue();
        initialVelocity2Slider.updateCurrentValue();
        //here is where we will set the values back to default for the blocks
      }
      if(startSimButton.checkClick()) {
        //here is where we put the code to start the simulation
      }
      //here is where we update which is the clicked button in the two-way button
      elasticButton.updateClickStatus();
      inelasticButton.updateClickStatus();
      break;
  }
}

void mouseDragged() {
  //Code for the sliders
  frictionSlider.respondToDrag();
  initialVelocity1Slider.respondToDrag();
  initialVelocity2Slider.respondToDrag();
}
