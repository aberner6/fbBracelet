import toxi.util.datatypes.*;

// ------------- sketch variables

PVector temp1;
PVector temp2;
PVector temp3;
PVector temp4;
PVector temp5;
PVector temp6;
// ------------- canvas variables
PGraphics canvas;
int canvas_width = 1200;
int canvas_height = 100;
float ratioWidth = 1;
float ratioHeight = 1;
float ratio = 1;
int margin = 20;
// ------------- sketch variables
//int radius = 6; //
//float radius = map(12, 0, 30, 0, canvas_width); //mapping to how many days in a month
//float radius = map(6, 0, 30, 0, canvas_height); //mapping to how many days in a month
float radius = canvas_height/2-margin;
//int monthBorn = 8;
//float numPoints = 17;//map(12, 0, 30, 0, canvas_height); //mapping to how many days in a month
int monthBorn = 6;
float numPoints = 12;//map(12, 0, 30, 0, canvas_height); //mapping to how many days in a month
int myYear = 1988;
float yearBorn = map(myYear, 0, 2014, 0, canvas_width);


float pointDegree = 360 / numPoints;
float noiseCount = 0;


float whereMonth = map(monthBorn, 1, 12, radius*2, canvas_width-radius*2);
void setup() { 
  size(canvas_width, canvas_height);
  background(255);
  smooth(8);

  // ------------- construct/resize canvas
  canvas = createGraphics(canvas_width, canvas_height);
  calculateResizeRatio();

  Planet p = new Planet();
  // --------------------------------------- CANVAS
  canvas.beginDraw();
  canvas.smooth(8);
  canvas.strokeWeight(.1);
  canvas.background(100);
  canvas.translate(whereMonth, canvas.height/2); 
  println(whereMonth);  
  //  canvas.translate(canvas.width, canvas.height/2); 
  p.drawPlanet();

  // ------------- title
  canvas.fill(255);
  canvas.translate(0, 0);

  // ------------- blurbs
  canvas.fill(0);

  canvas.endDraw();
  // --------------------------------------- CANVAS  

  // resize the offline canvas according to the resize ratio
  float resizedWidth = (float) canvas.width * ratio;
  float resizedHeight = (float) canvas.height * ratio;

  // draw the offline canvas on the screen canvas
  image(canvas, (width / 2) - (resizedWidth / 2), (height / 2) - (resizedHeight / 2), resizedWidth, resizedHeight);

  canvas.save("sketchMCB"+minute()+second()+".png");
}

// ------------- resize the offline canvas to be viewable on the screen canvas
void calculateResizeRatio() {
  ratioWidth = (float) width / (float) canvas.width;
  ratioHeight = (float) height / (float) canvas.height;

  if (ratioWidth < ratioHeight)  ratio = ratioWidth;
  else                          ratio = ratioHeight;
}

