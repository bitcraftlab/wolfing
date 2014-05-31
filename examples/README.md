Examples
========

### Hello Wolf ###

This example shows how to evaluate expressions and display the result in Processing.


### Digits of Pi ###

This example shows how to construct expressions dynamically.  
The expression `N[Pi,  n]` returns the first `n` digits of **π**.

![DigitsOfPi.jpg](DigitsOfPi.jpg)


### ShapeData ###

Example of how to generate `.OBJ` meshes in WolframLang   
and import the result directly into Processing PShape files.  
This example uses the `PeasyCam` library.

![ShapeData.jpg](ShapeData.jpg)


### EvalToImage ###

Example of how to get the result of an expression as an image.  
The expression `ExampleData[{"TestImage", "Lena"}]` loads a testimage.  
Note that images retrieved via `wolf.evalToImage(...)` are encoded as GIFs.  
As a result the color palette is currently limited to 256 colors.

![EvalToImage.jpg](EvalToImage.jpg)
 
 
### Graphics3D ###
 
Another Example of *EvalToImage*
Using the powerfull `CellularAutomaton`, and `Graphics3D` functions of Mathematica. 

![Graphics3D.jpg](Graphics3D.jpg)
 
