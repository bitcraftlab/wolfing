// Render 3D Graphics in Mathematica + show them in Processing
import bitcraftlab.wolfing.*;
Wolfing wolf = new Wolfing(this);

String cmd = ""
  + "Graphics3D["
  + "  Cuboid /@ Position["
  + "    CellularAutomaton["
  + "      {14, {2, 1}, {1, 1, 1}}," 
  + "      {{{{1}}}, 0},"
  + "      {{{10}}}"
  + "    ], 1"  
  + "  ]"
  + ", Boxed -> False]"
  ;

int d = 20;
PImage img = wolf.evalToImage(cmd);
size(img.width + 2*d, img.height + 2*d);

background(255);
image(img, d, d);

