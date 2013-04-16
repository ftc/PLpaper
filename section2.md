# Section 2: Proposed Impact

Present specification evolved from GJ proposal. Sean will likely cover GJ in his section. 


Your paper on this change proposal should exhibit the following characteristics:

 * Document its proposed impact to the language and its use.

 * Apply the terminology and concepts we have used throughout the course. 
 
 * Provide supporting code examples, diagrams, and other evidence. 
 
 * Cite supporting evidence using primarily primary sources from the community of the language being investigated.


## Proposed Impact

 * Collections classes (Lists, Maps, etc.)
 * Reduce casting
 * Ensure type safety
 * Way to reuse same code with different inputs
 * Implement generic algorithms
 * [Why should I use generics?][1] 
  
 [1]: http://docs.oracle.com/javase/tutorial/java/generics/why.html
 

## Draft

The movement to add generic types to Java, which began in the Pizza and Generic Java programming languages, evolved into a formal proposal on May 11, 1999 when Java Specification Request (JSR) 14 was admitted to the Java Community Process ([JSR webpage][2]). As listed in the JSR's public review stage, the goal of the proposal was to add generic types and methods to Java to reap the benefits of "added expressiveness and safety that stems from making type parameters explicit and making type casts implicit" ([JSR Public Review][3]). In other words, code would be more readable and more type errors would be caught at compile time where they are easier to debug. 

One feature of JSR 14 is the addition of two types, parameterized types and type variables.  


































[2]: http://www.jcp.org/en/jsr/detail?id=14 
[3]: sources/jsr-14-public-draft/spec8.pdf

