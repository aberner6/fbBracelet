import geomerative.*;

float ratioWidth = 1;
float ratioHeight = 1;
float ratio = 1;
void setup() {
  size(1200, 200);
  smooth(8);
}
void draw() {

//void draw() {
  background(0);
  fill(0);
  stroke(255);
//  background(100);
//  fill(255);
//  stroke(0);
  for (int i=1988; i>0; i--) {
    float radius = map(i, 1988, 0, width*100, 0);
    float xradius = map(i, 1988, 0, width, 0);
    ellipse(width/2, height/2, xradius, width);
  }
   save("rings2.png");
}

