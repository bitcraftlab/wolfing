import bitcraftlab.wolfing.*;
Wolfing wolf = new Wolfing(this);

// get ready to draw
size(600, 800);
background(255);
fill(0); smooth();
textFont(createFont("", 7));
textAlign(CENTER);

// some parameters
int w = 6, h = 8; 
int cols = width / w;
int rows = height / h;
int digits = cols * rows;

// calculate digits of Pi
String query = "N[Pi, " + digits + "]";
String pi = wolf.eval(query);

// show them on a grid
translate(w/2, h-1);
for(int i = 0; i < digits; i++) {
   int x = i % cols;
   int y = i / cols;
   text(pi.charAt(i), w * x, h * y);
}
