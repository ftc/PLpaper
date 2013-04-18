# Section 3: Current Use

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

##Conclusion

Everything above helps to demonstrate that generic types provide a more versitile style of coding, while helping
ensure the debugging process is more located during compile time.
