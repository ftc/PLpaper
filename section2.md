# Section 2: Proposed Impact

## Intro

The movement to add generic types to Java, which began in the Pizza and Generic Java programming languages, evolved into a formal proposal on May 11, 1999 when Java Specification Request (JSR) 14 was admitted to the Java Community Process ([JSR webpage][2]). As listed in the JSR's public review stage, the goal of the proposal was to add generic types and methods to Java to reap the benefits of "added expressiveness and safety that stems from making type parameters explicit and making type casts implicit" ([JSR Public Review][3]). In other words, code would be more readable and more type errors would be caught at compile time where they are easier to debug. 

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

### Subtypes, Supertypes, Member Types

Contravariance: conversion from general to specific type
Covariance: conversion from specific to more general type
Invariance: can't convert between two types






























[1]: http://docs.oracle.com/javase/tutorial/java/generics/why.html
[2]: http://www.jcp.org/en/jsr/detail?id=14 
[3]: sources/jsr-14-public-draft/spec8.pdf
[4]: http://docs.oracle.com/javase/tutorial/java/generics/bounded.html

