# Why Spicy?

Historically extending Zeek with new parsers required writing C++ code which
was a significant barrier to entry for domain experts.

Spicy is a _domain-specific language_ for developing parsers for network protocols
or file formats which integrates well with Zeek.

## Flexible multi-paradigm language

With Spicy parsers can be
expressed in _declaratively_ in a format close to specifications, e.g., the
following TFTP `ERROR` message

```plain
#  2 bytes     2 bytes      string    1 byte
#  -----------------------------------------
# | Opcode |  ErrorCode |   ErrMsg   |   0  |
#  -----------------------------------------
```

can [be expressed in
Spicy](https://docs.zeek.org/projects/spicy/en/latest/tutorial/index.html) as

```spicy
type Error = unit {
    code: uint16;
    msg:  bytes &until=b"\x00";
};
```

Spicy supports procedual code which can be
[hooked](https://docs.zeek.org/projects/spicy/en/latest/programming/parsing.html#unit-hooks)
into parsing to support more complex parsing scenarios.

```spicy
function sum(a: uint64, b: uint64): uint64 { return a + b; }

type Fold = unit {
    a: uint8;
    b: uint8 &convert=sum(self.a, $$);
    c: uint8 &convert=sum(self.b, $$);
};
```

## Built-in safety

Spicy code is executed safely so many common errors are rejected, e.g.,

- integer under- or overflows
- iterator validity
- unhandled switch cases

## Integration into Zeek

Spicy parsers can trigger events in Zeek. Parse results can transparently be
made available to Zeek script code.
