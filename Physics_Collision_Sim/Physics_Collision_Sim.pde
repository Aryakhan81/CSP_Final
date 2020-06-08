/**
//TODO:
-----------
-> Enumeration for the screen names - DONE
-> Classes for Buttons, Sliders and Two-Way Buttons - DONE
-> Functions setting the screen upon each screen transition - DONE
-> setup(), draw() and mouseClicked()
-> Functions for elastic and inelastic collisions
**/

//Global constant for gravity
public static final float g = 0.2725F;
//global variable that shows the current screen
public static Screen currentScreen = Screen.WELCOME;
//Global constants for x position of each block
public static final float posX1 = 20;
public static final float posX2 = 720;

//buttons
Button startButton = new Button(525, 475, 150, 50, "Start!", Screen.SIMULATOR);
Button restartButton = new Button(1030, 730, 150, 50, "Start Over");
Button startSimButton = new Button(300, 600, 150, 50, "Start!");

//two way Buttons
TwoWayButton elasticButton = new TwoWayButton(850, 100, 150, 50, "elastic", false);
TwoWayButton inelasticButton = new TwoWayButton(1002, 100, 150, 50, "inelastic", true);

//sliders
Slider frictionSlider = new Slider(862, 250, 0, 1);
Slider initialVelocity1Slider = new Slider(862, 350, 0, 10);
Slider initialVelocity2Slider = new Slider(862, 450, 0, -10);
Slider mass1Slider = new Slider(862, 550, 0.1, 5);
Slider mass2Slider = new Slider(862, 650, 0.1, 5);

//blocks
Block block1 = new Block(posX1, 300);
Block block2 = new Block(posX2, 300);

//Screen options
public enum Screen {
  //What screens do we want to have?
  WELCOME,
  SIMULATOR
  //do we want to have a data screen where the velocities etc are displayed after the collision?
  //maybe add graphs?
}

//Do elastic collision. Formula found from socratic.org by Cosmic Defect
void elasticCollision(Block block1, Block block2) {
  float initialVelocity1 = block1.velocity;
  float initialVelocity2 = block2.velocity;
  float mass1 = block1.mass;
  float mass2 = block2.mass;

  float finalVelocity1 = ((mass1 - mass2)/(mass1 + mass2)) * initialVelocity1 + ((2 * mass2)/(mass1 + mass2)) * initialVelocity2;
  float finalVelocity2 = ((2 * mass1)/(mass1 + mass2)) * initialVelocity1 + ((mass2 - mass1)/(mass1 + mass2)) * initialVelocity2;

  block1.velocity = finalVelocity1;
  block2.velocity = finalVelocity2;
}

//Do inelastic collision. I derived the formula myself
void inelasticCollision(Block block1, Block block2) {
  float initialVelocity1 = block1.velocity;
  float initialVelocity2 = block2.velocity;
  float mass1 = block1.mass;
  float mass2 = block2.mass;

  float finalVelocity = ((mass1 * initialVelocity1) + (mass2 * initialVelocity2))/(mass1 + mass2);

  block1.velocity = block2.velocity = finalVelocity;
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
  mass1Slider.create(0, 35);
  mass2Slider.create(0, 35);
  //creates the titles for the Sliders
  fill(0);
  text("Collision type:", 925, 75);
  text("Coefficient of friction", 862, 235);
  text("Initial velocity of block 1", 862, 335);
  text("Initial velocity of block 2", 862, 435);
  text("Mass of block 1 (kg)", 865, 535);
  text("Mass of block 2 (kg)", 865, 635);
  //update the current value of the sliders
  frictionSlider.updateCurrentValue();
  initialVelocity1Slider.updateCurrentValue();
  initialVelocity2Slider.updateCurrentValue();
  mass1Slider.updateCurrentValue();
  mass2Slider.updateCurrentValue();
  //create a text area that displays the current value of each slider
  text(frictionSlider.currentValue, 1020, 265);
  text(initialVelocity1Slider.currentValue, 1020, 365);
  text(initialVelocity2Slider.currentValue, 1020, 465);
  text(mass1Slider.currentValue, 1020, 565);
  text(mass2Slider.currentValue, 1020, 665);
  //Draw out the area for the blocks to move on
  //table and floor
  fill(0);
  rect(20, 350, 750, 20);
  rect(30, 350, 30, 200);
  rect(730, 350, 30, 200);
  rect(10, 550, 770, 1);

  //meterstick
  fill(219, 202, 11, 255);
  rect(20, 300, 100, 25);
  //rulings on the meterstick
  fill(0);
  for(int i = 0; i < 10; i++) {
    line((30 + i*10), 300, (30 + i*10), 310);
  }

  //Update the blocks
  block1.update(frictionSlider.currentValue);
  block2.update(frictionSlider.currentValue);

  //Check for a collision and determine its type
  if(block1.hasCollidedWith(block2) || block1.hasCollidedWith(block1)) {
    if(elasticButton.isClicked) {
      elasticCollision(block1, block2);
    } else if(inelasticButton.isClicked) {
      inelasticCollision(block1, block2);
    }
  }
  
  fill(0);
  //Paste the current kinematic and dynamic values to the screen for block 1
  text("Block 1:", 200, 25);
  text("Velocity: " + Float.toString(block1.velocity), 200, 40);
  text("Momentum: " + Float.toString(block1.momentum), 200, 55);
  text("Kinetic Energy: " + Float.toString(block1.kineticEnergy), 200, 70);
  
  //Paste the current kinematic and dynamic values to the screen for block 2
  text("Block 2:", 400, 25);
  text("Velocity: " + Float.toString(block2.velocity), 400, 40);
  text("Momentum: " + Float.toString(block2.momentum), 400, 55);
  text("Kinetic Energy: " + Float.toString(block2.kineticEnergy), 400, 70);
  
}

void settings() {
  //Decide on screen size here
  size(1200, 800);
}

void setup() {
  frameRate(60);
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
        //sets the masses back to default
        mass1Slider.x = mass1Slider.lineX;
        mass2Slider.x = mass2Slider.lineX;
        mass1Slider.updateCurrentValue();
        mass2Slider.updateCurrentValue();
        //here is where we will set the values back to default for the blocks
        //Set the velocities of the blocks back to 0
        block1.velocity = 0;
        block2.velocity = 0;
        //Set the positions of the blocks back to default
        block1.x = posX1;
        block2.x = posX2;

        //Create them so we can see them
        block1.create();
        block2.create();
      }
      if(startSimButton.checkClick()) {
        //here is where we put the code to start the simulation

        //Set them back to their initial positions
        block1.x = posX1;
        block2.x = posX2;

        //set initial velocities
        block1.setInitialVelocity(initialVelocity1Slider.currentValue);
        block2.setInitialVelocity(initialVelocity2Slider.currentValue);

        //set masses
        block1.setMass(mass1Slider.currentValue);
        block2.setMass(mass2Slider.currentValue);
        
        //Tell the blocks to draw
        block1.shouldDraw = true;
        block2.shouldDraw = true;


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
  mass1Slider.respondToDrag();
  mass2Slider.respondToDrag();
}
