
package bitcraftlab.wolfing;

import com.wolfram.jlink.*;

import processing.core.PImage;
import processing.core.PGraphics;
import processing.core.PApplet;
import processing.core.PShape;
import processing.core.PShapeOBJ;

import processing.opengl.PShapeOpenGL;
import processing.opengl.PGraphicsOpenGL;

import java.io.ByteArrayInputStream;
import java.awt.image.BufferedImage;
import javax.imageio.ImageIO;

import java.io.BufferedReader;
import java.io.StringReader;


public class Wolfing {

	KernelLink ml =  null;
	PApplet app;

	// Paths to additional libs - not sure if the License permits to distribute those
	static final String[] libs = {
		//"/opt/Wolfram/WolframEngine/10.0/SystemFiles/Links/MathLink/DeveloperKit/Linux-ARM/CompilerAdditions/libML32i4.so"
   	    "/Applications/Mathematica.app/SystemFiles/Links/MathLink/DeveloperKit/MacOSX-x86-64/CompilerAdditions/libMLi3.a"
	};


	public Wolfing(PApplet theApp) {
	
		// We need to load the mathlink lib manually, otherwise the local copy of Jlink  embedded in exported applications won't work.
		// In OSX this approach will cause an error when using the soft-linked JLink.jar (inside the Processing IDE)
		// Simple solution: Try and Catch.
		
		app = theApp;

		for(String lib : libs) {
			
			try {

				System.load(lib);

			} catch(UnsatisfiedLinkError e) {

				System.out.println("Info: Wolfing failed to load the library" + e.getMessage());
				System.out.println("Don't worry!");

			}
		}
		
		openLink();

		System.out.println("Hello Wolfing");
		// greeting();
			
	}

	// this is called when the sketch is shutdown
	void dispose() {

		closeLink();

	}


	// launch a mathematica kernel
	void openLink() {
		
		String argv[] = { "-linkmode", "launch", "-linkname", "'/Applications/Mathematica.app/Contents/MacOS/MathKernel' -mathlink" };

		try {
			ml = MathLinkFactory.createKernelLink(argv);
			// discard greeting
			ml.discardAnswer();
		
		} catch (MathLinkException e) {

			System.out.println("Failed to open link:" + e.getMessage());

		}

	}

	// shutdown
	void closeLink() {

		ml.close();

	}


	// say hello to the world
	void greeting() {
		
		String query = "1 + 1";
		String result = eval(query);
		System.out.println(query + " = " + result); 
	
	}	


	// return evaluated query as string
	public String eval(String query) {
	
		// this function is asynchronous (!) we should use threading 
		// and callback functions for more complex calculations

		try {

			ml.evaluate(query);
			ml.waitForAnswer();
			return ml.getString();

		} catch(MathLinkException e) {

			System.out.println("Link missing in action: " + e.getMessage());

		}
		return null;	
	}


	// return evaluated query as image
	public PImage evalToImage(String query) {

		// automatic image size
		return evalToImage(query, 0, 0);

	}

	// return evaluated query as shape
	public PShape evalToShape(String query) {

		PShape shp = null;
		String str = eval(query);
		
		if(str != null) {

			 // read input from a string
  			BufferedReader input = new BufferedReader(new StringReader(str));
  			shp = loadShape(input);

		}
		
		return shp;

	}


	// return evaluate query as custom-sized image
	public PImage evalToImage(String query, int width, int height) {

		// This does not seem to work ...
		// ml.evaluateToOutputForm("JLink`$DefaultImageFormat = \"JPEG\"", 0);

		byte[] bytes = ml.evaluateToImage(query, width, height);

  		try {
		    ByteArrayInputStream bis = new ByteArrayInputStream(bytes);
		    BufferedImage image = ImageIO.read(bis);
		    bis.close();
		    PImage result = createPImage(image);
		    return result;
  		} 
  		catch(Exception e) {
   			e.printStackTrace();
  		}

		return null;
	
	}

	// Safe method to turn any image into a PImage
	private static PImage createPImage(BufferedImage img) {

	    int w = img.getWidth();
	    int h = img.getHeight();
	    BufferedImage img2 = new BufferedImage(w, h, BufferedImage.TYPE_INT_RGB); 
	    
	    // copy pixels
	    for (int x = 0; x < w; x++) {
	        for (int y = 0; y < h; y++) {
	            img2.setRGB(x, y, img.getRGB(x, y));
	        }
	    }
	    
	    return new PImage(img2);

	}

	// loadShape for buffered readers.
	private PShape loadShape(BufferedReader input) {

		PShapeOpenGL shape = null;
	  
		// We should not use the PShapeOBJ class directly.
		// But this seems to be the only way to read OBJ files directly from strings.
		PShape obj = new PShapeOBJ(app, input);
		PGraphics g = app.g;

		if (obj != null) {
			int prevTextureMode = g.textureMode;
			shape = PShapeOpenGL.createShape((PGraphicsOpenGL) g, obj);
			g.textureMode = prevTextureMode; 
		}

		return shape;
	}




}

