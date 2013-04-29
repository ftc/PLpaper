# Lightning Talk

## Introduction

## Slide 2 - Sean Start

## Slide 3

## Slide 4

## Slide 5

## Slide 6

## Slide 7

## Parameterized Types and Type Variables - Dylan Start

The main feature of JSR 14 is the addition of two new types, parameterized types and type variables. 

* Parameterized Types - Class followed by parameter section <T<sub>1</sub>, … , T<sub>n</sub>> 
* Type Variables - Act as placeholders for types passed by programmer

## Generic Class Example 

	public class Example<K, V> {
	
		private K key;		// declare variable key of type K
		private V value; 	// declare variable value of type V
	
		public Example(K key, V value) {	// constructor
			this.key = key;
			this.value = value;
		}
	}

## Partial Grammar Tree

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

## Bounded Type Parameters

Used to limit the possible types passed as type arguments. This is useful if, say, you write a function that only makes sense when operating on numbers. 

To declare a bounded type parameter you list the parameter's name followed by the *extends* keyword, followed by the upper bound.

## Bounded Type Example

This example defines a method inspect() that prints the type of class variable t and function parameter u. The parameter u only accepts Numbers or subtypes of Number. Calling it on a String type throws an error.

	public class Box<T> {

	    private T t;          
	
	    public void set(T t) {
	    	this.t = t;
	    }
	    
	    public T get() {
	    	return t;
	    }
	    	
	    public <U extends Number> void inspect(U u){
	        System.out.println("T: " + t.getClass().getName());
	        System.out.println("U: " + u.getClass().getName());
	    }
	
	    public static void main(String[] args) {
	        Box<Integer> integerBox = new Box<Integer>();
	        integerBox.set(new Integer(10));
	        integerBox.inspect("some text"); // error: this is still String!
	    }
	}
	
## Covariance and Contravariance

## Slide 14 - Ryan Start

## Slide 15

## Slide 16

## Slide 17

## Slide 18

## Slide 19

## Conclusion