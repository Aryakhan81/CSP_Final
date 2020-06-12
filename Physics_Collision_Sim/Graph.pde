import java.util.ArrayList;
import java.lang.Math;

/***
DOCUMENTATION:
-> Create in instance of the graph class using the constructor
-> Call graph.addData(float newData) in the simulator() function 
and pass in the value of interest
-> In the start button click response, set graph.shouldCollectData = true
Also call graph.resetData()
-> In the start over button response, set graph.shouldCollectData = false
Also call graph.resetData()
-> In the data() function, call graph.create()
***/

class Graph {
  ArrayList<Float> data = new ArrayList<Float>();
  float x, y, width, height;
  boolean shouldCollectData = false;
  String title;
  float maxX, maxY;
  
  //Cosntructor
  public Graph(float x, float y, float width, float height, String title) {
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    this.title = title;
  }
  
  //Add data to the data list
  void addData(float newData) {
    if(this.shouldCollectData) {
      this.data.add(newData);
    }
  }
  
  //Reset the data
  void resetData() {
    this.data.clear();
  }
  
  //Find the max value in the array. For use only in this class
  private float findMax() {
    float currentValue;
    float maxValue;
    
    //Will we ba able to find the max value without it throwing an error?
    try {
      maxValue = this.data.get(0);
      for(int i = 0; i < this.data.size(); i++) {
      currentValue = this.data.get(i);
      
        //See if the current value is less than the previous min value
        if(currentValue > maxValue) {
          maxValue = currentValue;
        }
      }
    } catch(Exception e) {
      //Go back to the simulator because there are no collected data
      currentScreen = Screen.SIMULATOR;
      maxValue = 0;
    }
    return maxValue;
  }
  
  //Find the min value in the array. For use only in this class
  private float findMin() {
    float currentValue;
    float minValue;
    
    //Will we ba able to find the min value without it throwing an error?
    try {
      minValue = this.data.get(0);
      for(int i = 0; i < this.data.size(); i++) {
      currentValue = this.data.get(i);
      
        //See if the current value is less than the previous min value
        if(currentValue < minValue) {
          minValue = currentValue;
        }
      }
    } catch(IndexOutOfBoundsException e) {
      //Go back to the simulator because there are no collected data
      currentScreen = Screen.SIMULATOR;
      minValue = 0;
      
      e.printStackTrace();
    }
    return minValue;
  }
  
  //Draw the outline of the graph. Private method; will only be used in this class
  private void drawOutline() {
    fill(0);
    System.out.println(this.title + ": " + this.findMax()); 
    //See if we should draw a negative y part as well
    if(this.findMin() > 0) {
      
      //Set the maxX and maxY values
      this.maxX = (float)(this.data.size()/60) + 1;
      this.maxY = 10 * ceil(this.findMax()/10) + 10;
      
      //Graph Axes
      line(this.x, this.y - this.height, this.x, this.y);
      line(this.x, this.y, this.x + this.width, this.y);
      
      //Graph Text
      text(Integer.toString((int)maxY), this.x - 25, this.y - this.height + 10);
      text("0", this.x - 15, this.y);
      text("0", this.x, this.y + 18);
      text(Integer.toString((int)maxX), this.x + this.width - 5, this.y + 18);
      text(this.title, this.x + this.width/5, this.y - this.height - 5);
      
    } else if(this.findMax() < 0) {
      
      //Set the maxX and maxY values
      this.maxX = (float)(this.data.size()/60) + 1;
      this.maxY = 10 * ceil(this.findMin()/10) - 10;
      
      //Graph Axes
      line(this.x, this.y - this.height, this.x, this.y);
      line(this.x, this.y - this.height, this.x + this.width, this.y - this.height);
      
      //Graph Text
      text(Integer.toString((int)maxY), this.x - 35, this.y + 10);
      text("0", this.x - 15, this.y - this.height + 18);
      text("0", this.x, this.y - this.height - 5);
      text(Integer.toString((int)maxX), this.x + this.width - 5, this.y - this.height - 5);
      text(this.title, this.x + this.width/5, this.y - this.height - 35);
      
    } else {
      
      //Set the maxX and maxY values
      this.maxX = (float)(this.data.size()/60) + 1;
      this.maxY = Math.max(abs(10 * ceil(this.findMin()/10) - 10), abs(10 * ceil(this.findMax()/10) + 10));
      
      //Graph Axes
      line(this.x, this.y - this.height, this.x, this.y);
      line(this.x, this.y - this.height/2, this.x + this.width, this.y - this.height/2);
      
      //Graph Text
      text(Integer.toString((int)(-1 * maxY)), this.x - 35, this.y);
      text(Integer.toString((int)(maxY)), this.x - 25, this.y - this.height + 18);
      text("0", this.x - 15, this.y - this.height/2 + 6);
      text(Integer.toString((int)maxX), this.x + this.width - 5, this.y - this.height/2 + 18);
      text(this.title, this.x + this.width/5, this.y - this.height - 5);
      
    }
  }
  
  void create() {
    //Draw the outline
    this.drawOutline();
    
    //Scale the axes
    float scaledX = this.width/(this.maxX * 60);
    float scaledY = this.height/this.maxY;
    
    for(int i = 0; i < this.data.size(); i++) {
      fill(0);
      float xcoord = i * scaledX;
      float ycoord = this.data.get(i) * scaledY;
      
      //See where we should draw the data points
      if(this.findMin() > 0) {
        circle(this.x + xcoord, this.y - ycoord, 4);
      } else if(this.findMax() < 0) {
        circle(this.x + xcoord, this.y - (this.height - ycoord), 4);
      } else {
        circle(this.x + xcoord, this.y - (this.height - ycoord), 4);
      }
      
    }
  }
} 
