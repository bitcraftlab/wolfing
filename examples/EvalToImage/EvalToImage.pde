import bitcraftlab.wolfing.*;

Wolfing wolf;
PImage result;

void setup() {
  
  // create new MathLink
  wolf = new Wolfing();
  
  // Load a sample image in Mathematica
  String filename = "ExampleData/rose.gif";
  String cmd = "Import[\"" + filename +  "\"]";
  PImage result = wolf.evalToImage(cmd);

  // show the result
  size(result.width, result.height);
  image(result, 0, 0);
  
}

