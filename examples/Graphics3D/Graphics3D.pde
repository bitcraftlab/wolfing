import bitcraftlab.wolfing.*;
Wolfing wolf = new Wolfing();
int d = 20;

// Render 3D Graphics in Mathematica + show them in Processing
PImage img = wolf.evalToImage("Show[Graphics3D[Cuboid /@ Position[CellularAutomaton[{14, {2, 1}, {1, 1, 1}}, {{{{1}}}, 0}, {{{10}}}], 1]], Boxed -> False]");
size(img.width + 2*d, img.height + 2*d);

background(255);
image(img, d, d);

