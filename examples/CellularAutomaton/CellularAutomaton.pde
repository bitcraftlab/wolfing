import bitcraftlab.wolfing.*;
Wolfing wolf = new Wolfing(this);

PImage img;
int rule;

void setup() {
  size(600, 300);
  update();
}

void draw() {
  
  // draw label
  image(img, 0, 0);
  fill(255, 200); noStroke();
  rect(10, 10, 80, 30);
  textMode(CENTER);
  fill(0); text("RULE " + rule, 20, 30);
  
  // pick next rule
  int nextRule =constrain(mouseX * 255 / width, 0, 255);
  if(nextRule != rule) {
    rule = nextRule; 
    update();
  }
 
}


void update() {
  String cmd = getCommand(rule, height);
  img = wolf.evalToImage(cmd, width, height);
  image(img, 0, 0);
}


String getCommand(int rule, int iter) {
  
  String attrs = ""
  + "PixelConstrained -> 1,"
  + "Frame -> False"
  ;
    
  return ""
  + "ArrayPlot["
  + "  CellularAutomaton["
  + "    " + rule + ","
  + "    {{1}, 0},"
  + "    { " + iter +  ", All}"
  + "  ]," 
  +  attrs
  + "]"
  ;
  
}


