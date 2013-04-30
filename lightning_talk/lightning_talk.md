# Lightning Talk

## Introduction

* Java was introduced in 1995 with the intent of being able to write code once and run it anywhere
* It derived much of its original syntax from the C++ programming language
* Templates were left out
* Generics were introduced to cover much of what was left out with templates

## Slide 2 - Sean Start

Why didn't Java implement templates while implementing much of the rest of C++?

## Slide 3

Under the hood of templates

* When you call a template function in C++ the compiler translates it into a function for that specific usage
* Can create massive numbers of functions for a relatively small amount of code
* Can cause hard to read errors

## Slide 4
A simple example

    #include <stdio.h>
    using namespace std;

    template <class T>
    T getMax(T a, T b) {
      return (a>b?a:b);
    }
    int main(void) {
      printf("max of 23,47 is %i\n", getMax(23,47));
      printf("max of 2.3,7.8 is %e\n", getMax(2.3,7.8));
    }

## Slide 5
getMax(int a, int b)

    0000000000400597 <_Z6getMaxIiET_S0_S0_>:
    400597:       55                      push   %rbp
    400598:       48 89 e5                mov    %rsp,%rbp
    40059b:       89 7d fc                mov    %edi,-0x4(%rbp)
    40059e:       89 75 f8                mov    %esi,-0x8(%rbp)
    4005a1:       8b 45 fc                mov    -0x4(%rbp),%eax
    4005a4:       3b 45 f8                cmp    -0x8(%rbp),%eax
    4005a7:       7e 05                   jle    4005ae <_Z6getMaxIiET_S0_S0_+0x17>
    4005a9:       8b 45 fc                mov    -0x4(%rbp),%eax
    4005ac:       eb 03                   jmp    4005b1 <_Z6getMaxIiET_S0_S0_+0x1a>
    4005ae:       8b 45 f8                mov    -0x8(%rbp),%eax
    4005b1:       5d                      pop    %rbp
    4005b2:       c3                      retq 

## Slide 6
getMax(float a, float b)

    00000000004005b3 <_Z6getMaxIdET_S0_S0_>:
    4005b3:       55                      push   %rbp
    4005b4:       48 89 e5                mov    %rsp,%rbp
    4005b7:       f2 0f 11 45 f8          movsd  %xmm0,-0x8(%rbp)
    4005bc:       f2 0f 11 4d f0          movsd  %xmm1,-0x10(%rbp)
    4005c1:       f2 0f 10 45 f8          movsd  -0x8(%rbp),%xmm0
    4005c6:       66 0f 2e 45 f0          ucomisd -0x10(%rbp),%xmm0
    4005cb:       76 06                   jbe    4005d3 <_Z6getMaxIdET_S0_S0_+0x20>
    4005cd:       48 8b 45 f8             mov    -0x8(%rbp),%rax
    4005d1:       eb 04                   jmp    4005d7 <_Z6getMaxIdET_S0_S0_+0x24>
    4005d3:       48 8b 45 f0             mov    -0x10(%rbp),%rax
    4005d7:       48 89 45 e8             mov    %rax,-0x18(%rbp)
    4005db:       f2 0f 10 45 e8          movsd  -0x18(%rbp),%xmm0
    4005e0:       5d                      pop    %rbp
    4005e1:       c3                      retq   
    4005e2:       66 2e 0f 1f 84 00 00    nopw   %cs:0x0(%rax,%rax,1)
    4005e9:       00 00 00 
    4005ec:       0f 1f 40 00             nopl   0x0(%rax)


## Slide 7
How do generics handle this?

* Error checking - Static analysis is used to determine if the code should throw an error
* Type erasure - Java throws out the types of the objects at compile time and casts them to the appropriate type

Why is this important?

* Speeds up compile time
* Reduces binary size
* Errors can be understood by mere mortals


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
