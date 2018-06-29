ArrayList <PVector> points = new ArrayList <PVector> ();

float x =0;
float y =0;
float hue = 0;
float speed = 0.5;


void setup() {
  size(600, 600);
  background(51);
  colorMode(HSB, 255, 255, 255);
}

void nextPoint() {
  float nextX;
  float nextY;

  float r = random(1);

  if (r < 0.01) {
    //1
    nextX =  0;
    nextY =  0.16 * y;
  } else if (r<0.86) {
    //2
    nextX =  0.85 * x +  0.04 * y;
    nextY = -0.04 * x +  0.85 * y + 1.6;
  } else if (r < 0.93) {
    //3
    nextX =  0.2  * x + -0.26 * y;
    nextY =  0.23 * x +  0.22 * y + 1.6;
  } else {
    //4
    nextX = -0.15 * x +  0.28 * y;
    nextY =  0.26 * x +  0.24 * y + 0.44;
  }

  x = nextX;
  y = nextY;
}

void addPoint() {
  strokeWeight(1);  
  float px = map(x, -3, 3, 0, width);
  float py = map(y, 0, 10, height, 0);
  points.add(new PVector(px, py));
}

void draw() {
  for (int i = 0; i < 500; i++) {
    nextPoint();
    addPoint();
  }
  while (points.size() > 1000) {
    points.remove(0);
  }
  for (int i=0; i<points.size(); i++) {
    PVector P = points.get(i);
    ellipse(P.x, P.y, 1, 1);
  }
  stroke(hue, 255, 255, 255);
  if (hue + speed <= 255) {
    hue += speed;
  } else {
    hue =  0;
  }
}
