##A Brief History

Java was originally released in 1995 with the intent of allowing programs to be run in a number of places despite 
only being written and tested on one platform.  It followed much of the original C++ syntax however one commonly 
used construct was left out of the original release, templates.  Templates are basically a set of precompiler 
directives that generate the needed functions automatically. For example you could write a function that takes 
the square root of a number where the number is a short int or long while only writing one function.  This is 
implemented by detecting which usages actually occur in the code and having the compiler generate a function for 
each case.  However this is difficult to implement in Java which doesn't have a precompiler in that sense.  In 
addition it can be mathematically proven that the C++ templates are Turing complete at compile time. This means
that any computational operation can be performed by the operations performed on templates in a C++ program during 
the compilation of the program.  Many have commented that this is has huge potentials for abuse and reduces the 
readability of code.

The generic implementation that was added to Java have a fairly similar superficial purpose, however they are much 
simpler and more elegant.  Instead of generating new functions for each use case, the method remains generic after 
compile time and what to do is determined at run time.  At first glance this would seem like it would be less 
computationally efficient, however as with many new programming concepts it turns out that the clarity added is much 
more valuable than the negligible amount of computing time saved.  This also adds many useful features such as a clean
way to limit the types of parameterizations to specific ranges of classes.
  
The first attempt to add generics to Java was a programming language called Pizza authored by Martin Odersky who later
went on to program Generic Java and Scala.  This language was specifically designed to take three key features from 
older functional programming languages; generics, higher order functions, and pattern matching.  Pizza was not a very 
complete system and often had compatibility issues with the Java virtual machine.  For this reason Martin Odersky was 
approached by several developers from the Sun Java development team to create a new language called Generic Java which 
integrated better with the JVM and held closer to the Java language to facilitate transitions.  This language was 
eventually merged with the mainstream Java in jsr14.  Generics in Java remain a powerful tool for Java programmers 
even today.  However Martin Odersky was not satisfied with this. Citing concerns with hard constraints of Java such 
as backwards compatibility and problems with generic arrays, he moved on to create the Scala programming language 
which attempts to improve the functional nature of Java.

As listed in the JSR's public review stage, the goal of the proposal was to add generic types and methods to Java to 
reap the benefits of "added expressiveness and safety that stems from making type parameters explicit and making type 
casts implicit" (JSR Public Review). In other words, code would be more readable and more type errors would be caught 
at compile time where they are easier to debug. JSR 14 contains many specifics about how generics should be added to 
Java, but this section will only look at the core of how types are handled.

## Types

### Type Syntax

One feature of JSR 14 is the addition of two new types, parameterized types and type variables. Parameterized types consist of a class or interface C followed by a parameter section <T<sub>1</sub>, … ,T<sub>n</sub>>. The number of types in the parameter list <T<sub>1</sub>, … ,T<sub>n</sub>> must match the number of declared parameters in C. In addition, each type argument must be a subtype of the type parameter's bound types (more on bound types later). 

  public class Example<K, V> {
	
		private K key;		// declare variable key of type K
		private V value; 	// declare variable value of type V
	
		public Example(K key, V value) {	// Example constructor
			this.key = key;
			this.value = value;
		}
	}

Type variables are unqualified identifiers that are replaced with concrete types when the program is run. They are used in parameterized class/interface declarations and polymorphic method declarations ([JSR Public Review][3]). The syntax for these two constructs is described by the following grammar: 

	ReferenceType      		::= ClassOrInterfaceType
                     		| ArrayType
                     		| TypeVariable

	TypeVariable			::= Identifier

	ClassOrInterfaceType	::= ClassOrInterface TypeArgumentsOpt

	ClassOrInterface 		::= Identifier
							| ClassOrInterfaceType . Identifier
						
	TypeArguments			::= < ReferenceTypeList>

	ReferenceTypeList		::= ReferenceType
							| ReferenceTypeList , ReferenceType
							
Parameterized types can optionally have bounded type parameters that limit the possible types used in type arguments ([Bounded Type Parameters][4]). This is useful if, say, you wrote a function that only makes sense when operating on numbers. To ensure users of your function only pass arguments of type Number (or one of its subclasses) you could write the following: 

	public <U extends Number> void inspect(U u) { … }  

### Covariance and Contravariance

The hierarchical relationships between generic types present an opportunity to apply the lessons of covariance and contravariance learned in lecture. Covariance and contravariance describe how types in a language's type system are ordered from widest to narrowest. A type conversion is **covariant** if it converts from a specialized to a more general type (Dog -> Animal). A type conversion is **contravariant** if it converts from a general type to a specialized type (Animal -> Dog). Two types are **invariant** if they cannot be converted to one another (Dog -> Airplane). 

As proposed by JSR 14, generic types are invariant to one another ([The Grey Blog][5]). However, they can exhibit covariant and contravariant relationships by using the right keywords. To borrow Grey Blog's example, say you have the following object hierarchy: 

 
![Type Hierarchy][6] 


Now imagine that you have different boxes of Fruit and want to write methods that work on any specific Fruit (Apple, Strawberry). This can be done with a *wildcard with extends* to implement covariance.

	List<Apple> apples = new ArrayList<Apple>();
	List<? extends Fruit> fruits = apples;		     // valid code


Now you want to write methods the other way -- that is, write a method for Apples that will work on any Fruit. Use a *wildcard with super* to implement contravariance.

	List<Fruit> fruits = new ArrayList<Fruit>();
	List<? super Apple> = fruits;
  


[1]: http://docs.oracle.com/javase/tutorial/java/generics/why.html
[2]: http://www.jcp.org/en/jsr/detail?id=14 
[3]: sources/jsr-14-public-draft/spec8.pdf
[4]: http://docs.oracle.com/javase/tutorial/java/generics/bounded.html
[5]: http://thegreyblog.blogspot.com/2011/03/java-generics-tutorial-part-ii.html
[6]: sources/type-hierarchy.png


##Debugging Benefits

  As it was previously stated, one of the goals of adding generics to the Java Programming Language was to aid
in the process of debugging.  Before generics, Vector was the common storage class.  In the below example we use the superclass Fruit which has sub classes Apple, Strawberry, and FujiApple.

    Vector v = new Vector();
    v.add(new Apple());
    v.add(new Strawberry());
    
  A vector is able to take any object in java such as Integers, Strings, and Fruit.  The
reason this became impractical is when you wanted to retrieve the values you needed to cast them back to their original
types.
    Apple i = (Apple) v.get(0);
    Strawberry bar = (Strawberry) v.get(1);


  It can be seen here that this adds a burden on the user to not only write extra code for the casting but heterogeneous lists will become more difficult and error prone since the type of each object must be remembered.
  
  An improvement of this can be seen below with generic types.
  
    List<Fruit> list = new ArrayList<Fruit>();
    list.add(new Apple());
    list.add(new Strawberry());
    
    Apple i = list.get(0);
    Strawberry bar = list.get(1);
    
  Another advantage is that the compiler can check for obvious errors such as trying to add an integer to a list of fruit.
    
    list.add(new Integer(12));

    
This code snippet would throw an error if you tried compiling this.  Due to the invariance, you are unable to add
a type Integer to the type Fruit list.  Because this error is produced during compile time in place of run time,
the bug is more easily caught allowing for better program reliability.

##Implementing Generic Types

So since jsr-14 has been accepted and integrated into Java, there is a library of types with their own classes
already implemented.  For example there is already the interface List with it's classes add, get, size, ect...  Although this is available, one great part about generics is that you can implement your own classes.  All generic types are
required to have one or more type parameters, although raw types are possible where there isn't an assigned type argument
for the generic class or framework.

    interface List<E> {
      void add(E x);
      Iterator<E> iterator();
    }

  All the types are required at least one parameter.  raw typess are more of a 'pre-generic'
  style.  generic and raw types can be weaved into the same code, but it can cause confusion.
  
    public class Box<T> {
      public void set(T t) { /* ... */ }
      // ...
    )
    
    Box rawBox = new Box();
    
This new Box can be assigned to a parameterized type in order to link togeter the previous style with generic typing,
however reversing this, assigning a parameterized type to a raw, will throw a warning.


#Conclusion

So, Pizza was originally created by Odersky in order to, among other features, implement generics demonstrated already
in languages such as Haskell.  This was a first attempt that later lead to jsr-14 which simply added this feature in
the Java Programming Language directly.  Although Odersky was not satisfied and continued on to develop the Scala
Programming Language, jsr-14 generics linked Java with previous more functional languages and is widely used in the
community today.  Now, with parameterized types and type variables available in Java the distinction between different
collection types allows for a much better understanding of contravariance, covariance, and invarianc in the Java
language.  The ability to implement your own generic types in an attempt to make a more specialized collection allows
for such an open source community to develop at a healthier rate as well.  These reasons are the broad strokes of the
benefits of the jsr-14 implementation.
