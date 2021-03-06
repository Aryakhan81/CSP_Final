/**
Usage: In the main class, in order to properly use the paired buttons, one needs to create:
-> Two instances of TwoWayButton
-> In the function that controls the screen that the buttons are on, use the setPartner(TwoWayButton partner) function
**/

class TwoWayButton extends Button {
  TwoWayButton partner;
  boolean isInitial, isClicked;
  
  //Two-Way button constructor: same as a button, but you choose its partner
  public TwoWayButton(float x, float y, float width, float height, String text, boolean isInitial) {
    
    super(x, y, width, height, text);
    this.isInitial = isInitial;
    //If the button is the initial button to be clicked, it needs to act clicked
    this.isClicked = isInitial;
  }
  
  //The create function for the button. Should also be used to constantly update the button's appearance
  @Override
  public void create(float textX, float textY) {
    
    if(this.isClicked) {
      
      //If it's clicked, it will be black with white text
      textSize(16);
      fill(100);
      rect(this.x, this.y, this.width, this.height, 12);
      fill(255);
      text(this.text, this.x + textX, this.y + textY);  
      
    } else {
      
      //If it isn't, it'll look normal
      textSize(16);
      fill(255);
      rect(this.x, this.y, this.width, this.height, 12);
      fill(0);
      text(this.text, this.x + textX, this.y + textY);
    }
  }
  
  //Run ONLY in mouseClicked() to see if this button was actually the one being clicked
  public void updateClickStatus() {

    //If I am clicked, turn me on to click mode and my partner off
    if(this.checkClick()) {
      this.isClicked = true;
    } else if (!this.checkClick() && partner.checkClick()) {
      this.isClicked = false;
    } else {
      return;
    }
      
  }
  
  //Use this to set the button's partner. Must be done inside of the function that the screen is on.
  //This allows for a single pair to be reused on multiple screens
  public void setPartner(TwoWayButton partner) {
    this.partner = partner;
  }
}
