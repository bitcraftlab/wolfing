// Render 3D Graphics in Mathematica + show them in Processing
import bitcraftlab.wolfing.*;

size(500, 500);

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

PImage img = wolf.evalToImage(cmd);

// offset to center the image
int tx = (width - img.width) / 2;
int ty = (height - img.height) / 2;

background(255);
image(img, tx, ty);
