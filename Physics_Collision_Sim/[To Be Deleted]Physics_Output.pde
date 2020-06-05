// the purpose of this file is to calculate the speed the second object should be going based on the first objects velocity and mass.
// resolution of program - 1200x800
// max speed of first object is 10m/s; max speed of second object 50m/s
// coefficient of friction 0 - 1.00
// 0kg - 5kg masses
// 60fps
int velocity1;
int velocity2;
int friction;
float gravity = 9.8;
int mass1;
int mass2;
int momentum = velocity1 * mass1;
velocity2 = momentum / mass2;
// mass1 * velocity1 = velocity2 * mass2 = momentum
// calculate without friction first
int positionx1 = 200;
int positionx2 = 800;

if (velocity1 > 0)(
  positionx1 + (velocity1 * 10)
);
