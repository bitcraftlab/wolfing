import bitcraftlab.wolfing.*;

// create new MathLink
Wolfing wolf = new Wolfing(this);

// Load sample image from Mathematica's local folder
// String cmd = "Import[\"ExampleData/lena.tif\"]";

// Load sample image from the cloud
String type = "TestImage", name = "Lena";
String cmd = "ExampleData[{\"" + type + "\", \"" + name + "\"}]";

// note that the result has only 256 colors (gif)
PImage result = wolf.evalToImage(cmd);

// draw it to the canvas
size(512, 512);
image(result, 0, 0);
