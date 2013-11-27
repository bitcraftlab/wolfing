
Wolfing: WolframLang for Processing
===================================

Harness the power of Mathematica and Wolfram Alpha in your Processing Sketches!

![Screenshot](wolfing-screenshot.jpg)

This library is targetted at RaspBerry Pi, which is currently the
only platform where Mathematica and WolframLang are available free of charge,
for personal and educational use.

### Examples

- Calculate the result of 1 + 1
- Show as many digits of Pi as your screen can cope with
- More to come :-)


### License

This software is released under an LGPL License.
It's a Wrapper for JLink, provided by Wolfram under their own License.
Wolfing is not associated in any way with Wolfram Research or Mathematica.


### Getting started 

These instructions refer to Raspbian on a Raspberry Pi.


####  Install Mathematica

Open a terminal and type:

	sudo apt-get update && sudo apt-get install wolfram-engine


#### Install Processing


Download Processing 1.5.1 [here](http://www.processing.org/download).


1. Extract

		tar xvzf processing-1.5.1-linux.tgz

2. Replace the bundled java by the Raspberry version

		cd processing-1.5.1
		rm -rf java
		ln -s /usr/lib/jvm/jdk-7-oracle-armhf java

3. Install
	
		cd ..
		sudo mv processing-1.5.1 /opt
		ln -s /opt/processing-1.5.1/processing ~/bin
		chmod 755 ~/bin/processing


### Install Wolfing 


Download the latest release [here](https://github.com/bitcraftlab/wolfing/releases/download/v.0.0.1/wolfing-0.0.1.zip).

	
1. Extract it to your Processing library folder

		unzip wolfing-0.0.1.zip -d ~/sketchbook/libraries


2. Add JLink files:

		cd sketchbook/libraries/wolfing
		make link

### Export Applications from Processing

When you export a sketch as application, Processing will automatically copy all libraries to the sketch. The application should now work out of the box on any Raspberry Pi that has wolfram-engine installed.

### Wolfing on other Operating Systems

I adapted Wolfing for OSX with Mathematica Home License in the [OSX Branch](https://github.com/bitcraftlab/wolfing/tree/osx).  
If you are running a different OS and Version of Mathematica, make sure to adjust the locations
in the Makefile and the source accordingly.
