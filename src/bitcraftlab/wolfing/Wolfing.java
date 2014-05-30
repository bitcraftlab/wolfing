
package bitcraftlab.wolfing;

import com.wolfram.jlink.*;

public class Wolfing {

	KernelLink ml =  null;

	// Paths to additional libs - not sure if the License permits to distribute those
	static final String[] libs = {
		//"/opt/Wolfram/WolframEngine/10.0/SystemFiles/Links/MathLink/DeveloperKit/Linux-ARM/CompilerAdditions/libML32i4.so"
   	    "/Applications/Mathematica.app/SystemFiles/Links/MathLink/DeveloperKit/MacOSX-x86-64/CompilerAdditions/libMLi3.a"
	};


	public Wolfing() {
	
		// We need to load the mathlink lib manually, otherwise the local copy of Jlink  embedded in exported applications won't work.
		// In OSX this approach will cause an error when using the soft-linked JLink.jar (inside the Processing IDE)
		// Simple solution: Try and Catch.
		
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

			System.out.println("Link missing in action: " +e.getMessage());

		}
		return null;	
	}

}

