# Section 3: Current Use

##Debugging Benefits

  As it was previously stated, one of the goals of adding generics to the Java Programming Language was to aid
in the process of debugging.  Before generics, Vector was the common storage class.

    Vector V = new Vector();
    
  This is able to take all sorts of data types.  It can have integers, doubles, strings, ect... added into it.  The
reason this became impractical is when you wanted to retrieve the values you needed to cast them back to their original
types.  This caused an unneccessary amount of code when getting these values.
  The generics added allows for a much more readable code as well as a more efficient debugging process.  Take for example:
  
    private void testCollection() {
    List<String> list = new ArrayList<String>();
    list.add(new String("Hello world!"));
    list.add(new String("Good bye!"));
    list.add(new Integer(95));
    printCollection(list);
    }
    
This code snippet would throw an error if you tried compiling this.  Due to the invariance, you are unable to add
a type Integer to the type String list.  This is another example of a parameterized type, where it's subtypes are bounded
types based strictly off of the former parameter.  Because this error is produced during compile time in place of run time,
the bug is more easily caught allowing for a better debugging process overall.

##Implementing Generic Types

So since jsr-14 has been accepted and integrated into Java, there is a library of types with their own classes
already implemented.  For example there is already the interface List with it's classes add, get, size, ect...  Although
this is available, one great part about generics is that you can implement your own classes.  All generic types are
required to have one or more type parameters, although raw types are possible where there isn't an assigned type argument
for the generic class or framework.

    interface List<E> {
      void add(E x);
      Iterator<E> iterator();
    }

  All the types are required at least one parameter.  raw typess more of a 'pre-generic'
  style.  generic and raw types can be weaved into the same code, but it can cause confusion.
  
    public class Box<T> {
      public void set(T t) { /* ... */ }
      // ...
    )
    
    Box rawBox = new Box();
    
This new Box can be assigned to a parameterized type in order to link togeter the previous style with generic typing,
however reversing this will throw a warning.

##Conclusion

Everything above helps to demonstrate that generic types provide a more versitile style of coding, while helping
ensure the debugging process is more located during compile time.
