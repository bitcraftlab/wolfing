import bitcraftlab.wolfing.*;

// create new MathLink
Wolfing wolf = new Wolfing();

// Load a sample image
String type = "TestImage", name = "Lena";
String cmd = "ExampleData[{\"" + type + "\", \"" + name + "\"}]";

// note that the result has only 256 colors (gif)
PImage result = wolf.evalToImage(cmd);

// draw it to the canvas
size(result.width, result.height);
image(result, 0, 0);

