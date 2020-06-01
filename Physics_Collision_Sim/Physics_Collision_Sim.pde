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

//Screen options
public enum Screen {
  //What screens do we want to have?
  WELCOME,
  SIMULATOR,
  RESTART
  //do we want to have a data screen where the velocities etc are displayed after the collision?
  //maybe add graphs?
}

void toWelcomeScreen() {
  background(200);

  //print welcome and instruction text
  textSize(32);
  fill(0);
  text("welcome to Physics CollisionSim!", 200, 200);

}

void settings() {
  //Decide on screen size here
}

void draw() {
  //The heart of our program
}

void mouseClicked() {
  //This is where we put the "if clicked" code for the buttons,
}
