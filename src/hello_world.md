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

Here we have used Spicy's
[`spicyc`](https://docs.zeek.org/projects/spicy/en/latest/toolchain.html#spicyc)
executable to compile and immediately run the source file `hello.spicy`.
