ArrayList<PVector> shapePoints = new ArrayList();
ArrayList<PVector> shapePointsYear = new ArrayList();

class Planet {

  void drawPlanet() {
    // ------------- add PVector points to the arrayList   
    for (int i = 0; i < numPoints; i++) {
      float x = cos(radians(pointDegree * i)) * radius;
      float y = sin(radians(pointDegree * i)) * radius;
      //      float n = noise(noiseCount) * 20;
      float n = 0;
      PVector temp = new PVector(x + n, y + n);
      shapePoints.add(temp);
    }
    for (int i = 0; i < myYear; i++) {
      float x = cos(radians(pointDegree * i)) * yearBorn;
      float y = sin(radians(pointDegree * i)) * yearBorn;
      //      float n = noise(noiseCount) * 20;
      float n = 0;
      PVector temp = new PVector(x + n, y + n);
      shapePointsYear.add(temp);
    }

    canvas.beginShape();

    // ------------- outer circle  
    //    canvas.stroke(random(0,255));
    //    canvas.strokeWeight(3);
    //    for (int i = 0; i < numPoints/8; i++) {
    //      PVector thisvector = shapePoints.get(i);
    //      canvas.vertex(thisvector.x, thisvector.y);
    //      noiseCount += 0.2;
    //    }

    // ------------- transparent triangles
//    canvas.noStroke();
    canvas.stroke(255);
//    canvas.fill(random(0, 10), 80, random(200, 255), 10);
//    canvas.fill(random(0, 10), random(200, 255), 80, 10);
    canvas.fill(random(200, 255), random(0,10), 80, 10);
    for (int i = 0; i < 50; i++) {
      temp1 = shapePoints.get(int(random(0, shapePoints.size())));
      temp2 = shapePoints.get(int(random(0, shapePoints.size())));
      temp3 = shapePoints.get(int(random(0, shapePoints.size())));
      canvas.triangle(temp1.x, temp1.y, temp2.x, temp2.y, temp3.x, temp3.y);

    canvas.noFill();
      temp4 = shapePointsYear.get(int(random(0, shapePointsYear.size())));
      temp5 = shapePointsYear.get(int(random(0, shapePointsYear.size())));
      temp6 = shapePointsYear.get(int(random(0, shapePointsYear.size())));
      canvas.triangle(temp4.x, temp4.y, temp5.x, temp5.y, temp6.x, temp6.y);
    }

    canvas.endShape();
  }
}

