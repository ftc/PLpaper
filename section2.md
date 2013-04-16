# Section 2: Proposed Impact

## Intro

The movement to add generic types to Java, which began in the Pizza and Generic Java programming languages, evolved into a formal proposal on May 11, 1999 when Java Specification Request (JSR) 14 was admitted to the Java Community Process ([JSR webpage][2]). As listed in the JSR's public review stage, the goal of the proposal was to add generic types and methods to Java to reap the benefits of "added expressiveness and safety that stems from making type parameters explicit and making type casts implicit" ([JSR Public Review][3]). In other words, code would be more readable and more type errors would be caught at compile time where they are easier to debug. JSR 14 contains many specifics about how generics should be added to Java, but this section will only look at the core of how types are handled.

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

	ReferenceType      		::= ClassOrInterfaceType                     		| ArrayType                     		| TypeVariable

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

