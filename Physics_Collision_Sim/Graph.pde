import java.util.*;

class Graph {
  ArrayList<Float> data = new ArrayList<Float>();
  float x, y, width, height;
  
  //Cosntructor
  public Graph(float x, float y, float width, float height) {
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
  }
  
  //Add data to the data list
  void addData(float newData) {
    this.data.add(newData);
  }
  
  //Reset the data
  void resetData() {
    this.data.clear();
  }
  
  //Find the max value in the array. For use only in this class
  private float findMax() {
    float currentValue;
    float maxValue = 0;
    for(int i = 0; i < this.data.size(); i++) {
      currentValue = this.data.get(i);
      
      //See if the current value is greater than the previous max value
      if(currentValue > maxValue) {
        maxValue = currentValue;
      }
    }
    return maxValue;
  }
  
  //Find the min value in the array. For use only in this class
  private float findMin() {
    float currentValue;
    float minValue = 0;
    for(int i = 0; i < this.data.size(); i++) {
      currentValue = this.data.get(i);
      
      //See if the current value is greater than the previous max value
      if(currentValue < minValue) {
        minValue = currentValue;
      }
    }
    return minValue;
  }
  
  //Draw the outline of the graph. Private method; will only be used in this class
  private void drawOutline() {
    fill(0);
    
    //See if we should draw a negative y part as well
    if(this.findMin() > 0) {
      line(
    } else if(this.findMax() < 0) {
      
    } else {
      
    }
  }
} 
