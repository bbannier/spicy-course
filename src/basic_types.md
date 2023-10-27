# Basic types

All values in Spicy have a type.

While in some contexts types are required (e.g., when declaring types, or
function signatures), types can also be inferred (e.g., for variable
declarations).

```spicy
global N1 = 0;        # Inferred as uint64.
global N2: uint8 = 0; # Explicitly typed.

# Types required in signatures, here: `uint64` -> `void`
function foo(arg: int64) { 
    local dec = -1; # Inferred as int64.
    print arg + inc;
}
```

Spicy provides types for e.g.,

- integers, booleans
- bytes, string
- tuples, containers
- enums, structs
- network address, time, interval

See the
[documentation](https://docs.zeek.org/projects/spicy/en/latest/programming/language/types.html).
for the full list of supported types.
