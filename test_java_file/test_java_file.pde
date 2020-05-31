// static int shade = 0;
// static boolean goUp = true;
//
// void setup() {
//   fullScreen();
// }
//
// void draw() {
//   System.out.println(shade);
//   background(shade);
//
//   if (shade < 255 && goUp) {
//     shade++;
//   } else if (shade == 255) {
//     goUp = false;
//     shade--;
//   } else if (shade > 0 && !goUp) {
//     shade--;
//   } else if (shade == 0) {
//     goUp = true;
//     shade++;
//   }
// }

void hi() {
  fill(#ff2e69);
  rect(20, 20, 20, 20);
  
}

boolean checkColorWhite(double c) {
  if(c == 255) {
    return true; 
  } else {
    return false;
  }
}

void setup() {
  size(400, 400);
}

void draw() {
  hi();
  System.out.println(checkColorWhite(210.3));
}
