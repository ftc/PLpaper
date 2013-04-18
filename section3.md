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
    
This code snippet would throw an error if you tried compiling this.  Due to the contravariance, you are unable to add
a type Integer to the type String list.  This is another example of a parameterized type, where it's subtypes are bounded
types based strictly off of the former parameter.  Because this error is produced during compile time in place of run time,
the bug is more easily caught allowing for a better debugging process overall.
