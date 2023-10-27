# Exercises

- What happens at compile time if you try to create a `uint8` a value outside
  of its range, e.g., `uint8(-1)` or `uint8(1024)`?
- What happens at runtime if you perform an operation which leaves the domain of an integer value, e.g.,

  ```spicy
  global x = 0;
  print x - 1;

  global y: uint8 = 255;
  print x + 1;

  global z = 1024;
  print cast<uint8>(z);

  print 4711/0;
  ```
