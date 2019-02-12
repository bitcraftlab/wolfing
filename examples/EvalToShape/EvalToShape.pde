import bitcraftlab.wolfing.*;
import java.io.StringReader;
import peasy.PeasyCam;

PShape shp;
float w, h, zoom;

PeasyCam cam;
Wolfing wolf;

int pickShape;

// A list of shapes, that are available:
// ExampleData["Geometry3D"][[All, 2]]
String shapeNames[] = {
  "BassGuitar", "Beethoven", "CastleWall", "Cone", "Cow", "Deimos", 
  "Galleon", "HammerheadShark", "Horse", "KleinBottle", "MoebiusStrip", 
  "Phobos", "PottedPlant", "Seashell", "SedanCar", "SpaceShuttle", 
  "StanfordBunny", "Torus", "Tree", "Triceratops", "Tugboat", 
  "UtahTeapot", "UtahVWBug", "Vase", "VikingLander", "Wrench", 
  "Zeppelin"
};

void setup() {

  // screen size of 400x400 
  size(400, 400, P3D);

  // camera at a distance of 600 pixels
  cam = new PeasyCam(this, 600);

  // create a new Mathlink
  wolf = new Wolfing(this);
  
  nextShape();
  
}

void nextShape() {
  
  // pick the next shape
  pickShape = (pickShape + 1) % shapeNames.length;
 
  // get shape from wolfram
  shp = exampleShape(shapeNames[pickShape]);

  // rescale to processing coordinates
  shp.rotateX(HALF_PI);
  shp.scale(1, -1, 1);


  // get shape dimensions
  h = shp.getHeight();
  w = shp.getWidth();

  // minimum of screen to model ratio
  zoom = min(width / w, height / h);

  // scale the shape to screen size
  shp.scale(zoom);
  
}

PShape exampleShape(String name) {

  // this may take some time ...
  int startTime = millis();
  println("Start");

  // get a shape OBJ from mathematica
  String dataType = "Geometry3D";
  String dataObject = name;
  String cmd = "ExportString[ExampleData[{\"" + dataType + "\", \"" + name + "\"}], \"obj\"]";
  PShape shp = wolf.evalToShape(cmd);

  println("Loading the shape took: " + (millis() - startTime) / 1000.0 + " secs");
  return shp;
  
}


void draw() {

  // black background
  background(0);

  // follow the white rabbit!
  shp.setFill(color(255));

  // lights should be relative to the viewer (not the model)
  cam.beginHUD();
  lights();
  cam.endHUD(); 

  // display the rabbit
  shape(shp);
}


void keyPressed() {
  
  // press space to pick the next shape
  if(key == ' ') nextShape();
}

