# Parsing

Parsing in Spicy is centererd around the `unit` type which in many ways looks
similar to a `struct` type.

A unit declares an ordered list of fields which are parsed from the input.

If a unit is `public` it can serve as a top-level entry point for parsing.

```spicy
module foo;

public type Foo = unit {
    version: uint32;
};
```

We can run that parser by using a driver which feeds it input (potentially incrementally).

```console
$ printf '\x00\x00\x00\xFF' | spicy-dump -d hello.spicy
foo::Foo {
  version: 255
}
```

Here we use
[`spicy-dump`](https://docs.zeek.org/projects/spicy/en/latest/toolchain.html#spicy-dump)
as a driver. It reads input from its stdin and feeds it to the parser. After
parsing it prints the `unit`.

Another driver is
[`spicy-driver`](https://docs.zeek.org/projects/spicy/en/latest/toolchain.html#spicy-driver)
which just does not print the unit. Zeek also includes a dediced driver for
Spicy parsers.

## Differences to `struct`

While code generated for a `unit` is in many ways similar to the one generated for a `struct` it differs in crucial aspects:

- by default all `unit` fields are `&optional`, i.e., a `unit` value can have any or all fields unset,
- entry points for parsing are generated.
