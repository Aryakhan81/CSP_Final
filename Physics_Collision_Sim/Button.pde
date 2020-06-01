class Button {
  float x;
  float y;
  float width;
  float height;
  String text;
  Screen switchToScreen;

  //Button constructor 1: for screen-switching buttons
  public Button(float x, float y, float width, float height, String text, Screen switchToScreen) {
    this(x, y, width, height, text);
    this.switchToScreen = switchToScreen;
  }

  //Button constructor 2: for action-type buttons on the same screen
  public Button(float x, float y, float width, float height, String text) {
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    this.text = text;
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
