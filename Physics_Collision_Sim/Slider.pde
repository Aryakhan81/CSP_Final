/**
Usage: In the main class, in order to properly use the slider, one needs to create:
-> An instance of Slider
-> Inside of the mouseDragged() function, call the respondToDrag() method
-> Call both the create(textX, textY) and updateCurrentValue() methods in the function for the desired screen
-> To get the value of the slider, use the instance variable slider.currentValue
**/

class Slider extends Button {
  float lineX, lineY, lineLength, minValue, maxValue, currentValue;
  
  //Constructor
  public Slider(float x, float y, float minValue, float maxValue) {
    super(x, y, 25, 25, null);
    this.lineX = x;
    this.lineY = y + 12.5;
    this.minValue = minValue;
    this.maxValue = maxValue;
    //On creation, the slider will be set to its minimum
    this.currentValue = minValue;
    //The line length for all sliders is fixed to 125
    this.lineLength = 125;
  }
  
  //Paint the Slider to the  screen ONLY for the first time
  @Override
  public void create(float textX, float textY) {
    fill(0);
    line(this.lineX, this.lineY, this.lineX + this.lineLength, this.lineY);
    fill(255);
    rect(this.x, this.y, this.width, this.height, 12);
    fill(0);
    text(Float.toString(this.minValue), this.lineX + textX, this.lineY + textY);
    text(Float.toString(this.maxValue), this.lineX + this.lineLength + textX - 10, this.lineY + textY);
  }
  
  //Respond to being dragged. Will make use of checkClick() from superclass
  public void respondToDrag() {
    
    //If the slider button is within bounds, set its x coord to that of the mouse
    if(this.checkClick() && this.x <= this.lineX + this.lineLength && this.x >= this.lineX) {
      this.x = mouseX - 12.5;
      
    //If it went out of bounds to the right, set it to the rightmost point
    } else if(this.x >= this.lineX + this.lineLength) {
      this.x = this.lineX + this.lineLength;
    
    //If it went out of bounds to the left, se it to the leftmost point
    } else if(this.x <= this.lineX) {
      this.x = this.lineX;
      
    //This just makes it look clean
    } else {
      return;
    }
  }
  
  //Get the value of the slider a its current position
  public void updateCurrentValue() {
    float percentageCovered = (this.x - this.lineX)/this.lineLength;
    float scaledValue = percentageCovered * (maxValue - minValue);
    this.currentValue = scaledValue + minValue;
  }
}
