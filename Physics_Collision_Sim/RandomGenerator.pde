import java.util.Random;

//CODE ADAPTED FROM: https://dzone.com/articles/random-number-generation-in-java
static class RandomGenerator {
  
  //Random float generator (between 0.0 - 1.0)
  public static float randomFloat() {
    Random r = new Random();
    return r.nextFloat();
  }
  
  //Random float generator (between 0 and any other specified float)
  public static float randomFloat(float max) {
    float unscaled = randomFloat();
    return unscaled * max;
  }
  
  //Random integer generator (between min and max)
  public static int randomInt(int min, int max) {
    Random r = new Random();
    return r.nextInt((max - min) + 1) + min;
  }
}
