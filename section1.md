1. history of generics in java
  a.  Pizza (programming language) http://en.wikipedia.org/wiki/Pizza_%28programming_language%29
    -2001 discontinued in 2002
    -first attempt to add generics to java
    -showed that functional programming could be implemented in the java platform
    -created by odersky
    -three features from functional programming 
      *generics, 
      *higher-order functions, and 
      *pattern matching
    -Gilad Bracha and David Stoutamire from the Sun core developer team got in contact about developing GJ
  b.  GJ created 
    -new attempt at adding generics to java
    -smoother transition from java than pizza
    -better compatibility with jvm than pizza
  c.  Link with scala
    - Martin Odersky wanted to move on from the hard constraints of java
      -must have ungenerified types with the generified types
      -Must be backwards compatible which made it difficult to innovate with new syntaxes
      -problems with generic arrays

	Java was originally released in 1995 with the intent of allowing programs to be run in a number of places despite only being written and tested on one platform.  It followed much of the original C++ syntax however one commonly used construct was left out of the original release, templates.  Templates are basically a set of precompiler directives that generate the needed functions automatically. For example you could write a function that takes the square root of a number where the number is a short int or long while only writing one function.  This is implemented by detecting which usages actually occur in the code and having the compiler generate a function for each case.  However this is difficult to implement in Java which doesn't have a precompiler in that sense.  In addition it can be mathematically proven that the C++ templates are Turing complete at compile time. This means that any computational operation can be performed by the operations performed on templates in a C++ program during the compilation of the program.  Many have commented that this is has huge potentials for abuse and reduces the readability of code.
	
	
	The generic implementation that was added to Java have a fairly similar superficial purpose, however they are much simpler and more elegant.  Instead of generating new functions for each use case, the method remains generic after compile time and what to do is determined at run time.  At first glance this would seem like it would be less computationally efficient, however as with many new programming concepts it turns out that the clarity added is much more valuable than the negligible amount of computing time saved.  This also adds many useful features such as a clean way to limit the types of parameterizations to specific ranges of classes.
	
	
	The first attempt to add generics to Java was a programming language called Pizza authored by Martin Odersky who later went on to program Generic Java and Scala.  This language was specifically designed to take three key features from older functional programming languages; generics, higher order functions, and pattern matching.  Pizza was not a very complete system and often had compatibility issues with the Java virtual machine.  For this reason Martin Odersky was approached by several developers from the Sun Java development team to create a new language called Generic Java which integrated better with the JVM and held closer to the Java language to facilitate transitions.  This language was eventually merged with the mainstream Java in jsr14.  Generics in Java remain a powerful tool for Java programmers even today.  However Martin Odersky was not satisfied with this. Citing concerns with hard constraints of Java such as backwards compatibility and problems with generic arrays, he moved on to create the Scala programming language which attempts to improve the functional nature of Java.
