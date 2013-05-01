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
    400597:   55               push   %rbp
    400598:   48 89 e5         mov    %rsp,%rbp
    40059b:   89 7d fc         mov    %edi,-0x4(%rbp)
    ...
getMax(float a, float b)

    00000000004005b3 <_Z6getMaxIdET_S0_S0_>:
    4005b3:   55               push   %rbp
    4005b4:   48 89 e5         mov    %rsp,%rbp
    4005b7:   f2 0f 11 45 f8   movsd  %xmm0,-0x8(%rbp)
    ...


## Slide 6
How do generics handle this?

* Error checking - Static analysis is used to determine if the code should throw an error
* Type erasure - Java throws out the types of the objects at compile time and casts them to the appropriate type

Why is this important?

* Speeds up compile time
* Reduces binary size
* Errors can be understood by mere mortals

## Slide 7
Errors at the wrong time.

    struct Foo{
      private:
        int foo(){return 7;}
    };
    template <class T>
    int callFoo(T a){
      return a.foo();
    }
    
## Slide 8
Errors at the correct time.

    public class Bar {
      public Integer foo(){
        return 10;
      }
    }
    public class BarPriv extends Bar{
      private Integer foo() {  
        return 20;
      }
    }
    
Error: "Cannot reduce the visibility of the inherited method from Bar"

## Covariance and Contravariance - Dylan Start

**Covariance** - Type conversion from specialized to general type

**Contravariance** - Type conversion from general to specialized type

**Invariance** - Type conversion not possible

## Example Class Hierarchy 

![Type Hierarchy][1]

[1]: type-hierarchy.png

## Invariance Between Generics

Generic types are invariant to one another, so the following Java code will not compile.

	List<Apple> apples;
	List<Fruit> fruits = … ;
	apples = fruits;

	
## Bounded Type Parameters

Despite this invariance between generic types, you can introduce covariant and contravariant relationships using generic wildcards. 

This also touches on bounded type parameters, which limit the possible type arguments that can be passed to a type parameter. 

## Covariance with Extends

	List<Apple> apples = new ArrayList<Apple>();
	List<? extends Fruit> fruits = apples;
	
## Contravariance with Super

	List<Fruit> fruits = new ArrayList<Fruit>();
	List<? super Apple> = fruits;

## Slide 14 - Ryan Start

	Vector v = new Vector();
	v.add(new Apple());
	v.add(new Strawberry());
	Apple i = (Apple) v.get(0);
	Strawberry bar = (Strawberry) v.get(1);

## Slide 15

	List<Fruit> list = new ArrayList<Fruit>();
	list.add(new Apple());
	list.add(new Strawberry());

	Apple i = list.get(0);
	Strawberry bar = list.get(1);

## Slide 16

	List<Fruit> list = new ArrayList<Fruit>();
	list.add(new Integer(12));
	
This is an example of an error found at compile time due to Generics.

## Slide 17

	List<Fruit> bowl = new ArrayList<Ftruit>();
	for(Fruit fruit:bowl) {
  	eat(fruit);
	}

## Slide 18

	List bowl = new ArrayList();
	for (int i = 0; i < bowl.size(); i++) {
 	 if (!(bowl.get(i) instanceof Fruit)) {
	    continue;
	  } else {
	    Fruit fruit = (Fruit) bowl.get(i);
	    eat(fruit);
	  }
	}

## Slide 19

Evaluating Java Generics
Con: at execution time you might not know what type an object is meant to be.
Pro: Allows distinction of Covariance/Contravariance

## Conclusion


