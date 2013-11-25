import bitcraftlab.wolfing.*;

Wolfing wolf = new Wolfing();

String query = "1 + 1";
String result = wolf.eval(query);

background(0);
textAlign(CENTER);
text(query + " = " + result, 50, 50);
