# Hello world

```spicy
# hello.spicy
module hello;

print "Hello, world!";
```

- every Spicy source file needs to declare the module it belongs to
- global statements are run once when the module is initialized

Compile and run this code with

```console
$ spicyc -j hello.spicy
Hello, world!
```
