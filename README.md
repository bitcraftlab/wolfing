
Wolfing: WolframLang for Processing
===================================

Harness the power of Mathematica and Wolfram Alpha in your Processing Sketches!

![Screenshot](wolfing-screenshot.jpg)

The current version of the library now works with Processing 3.4 (tested)

It runs on:

-  OSX + Mathematica 11 (64bit) HOME EDITION (tested)
-  Raspberry Pi (Raspbian)

### Examples and Screenshots

[![example screenshot](examples/Graphics3D.jpg)][examples]

A list of all the examples can be found [here][examples].


### License

This software is released under an LGPL License.
It's a Wrapper for JLink, provided by Wolfram under their own License.
Wolfing is not associated in any way with Wolfram Research or Mathematica.

### Getting started 


- [Install on OSX](INSTALL-OSX.md)
- [Install on Raspberry Pi](INSTALL-PI.md)


### Export Applications from Processing

When you export a sketch as application, Processing will automatically copy all libraries to the sketch.  
The application should now work out of the box on any Mac that has Mathematica installed.
Use at your own risk and make sure to read the [JLink license](file:///Applications/Mathematica%20Home%20Edition.app/SystemFiles/Links/JLink/License.txt) if you plan to distribute your Application.

[examples]: examples
