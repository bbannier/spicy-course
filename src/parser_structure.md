# Structure of a parser

A parser contains a potentially empty ordered list of subparsers which are invoked in order.

```spicy
type Version = unit {
    major: uint32;
    minor: uint32;
    patch: uint32;
};
```

* * *

Behavior of individual subparsers or units can be controlled with attributes.

```spicy
type Version = unit {
    major: bytes &until=b".";
    minor: bytes &until=b".";
    patch: bytes &eod;
} &convert="v%s.%s.%s" % (self.major, self.minor, self.patch);
```

* * *

If one needs to extracted some data but does not need it one can declare an
anonymous field (without name) to avoid storing it. With `>=spicy-1.9.0`
(`>=zeek-6.1.0`) one additionally can explicitly [skip over input
data](https://docs.zeek.org/projects/spicy/en/latest/programming/parsing.html#skipping-input).

```spicy
# Parser for a series of digits. When done parsing yields the extracted number.
type Number = unit {
    n: /[[:digit:]]+/;
} &convert=self.n;

public type Version = unit {
    major: Number;
    : skip b".";
    minor: Number;
    : skip b".";
    patch: Number;
};
```

* * *

The used [byte
order](https://docs.zeek.org/projects/spicy/en/latest/programming/library.html#types)
can be controlled on the
[module](https://docs.zeek.org/projects/spicy/en/latest/programming/language/modules.html#global-properties),
[unit](https://docs.zeek.org/projects/spicy/en/latest/programming/parsing.html#unit-attributes),
or
[field](https://docs.zeek.org/projects/spicy/en/latest/programming/parsing.html#integer)
level.

```spicy
# The 'ByteOrder' type is defined in the built-in Spicy module.
import spicy;

# Switch default from default network byte order to little for this module.
%byte-order=spicy::ByteOrder::Little;

# This unit uses big byte order.
type X = unit {
    a: uint8;                                      # Use default byte order (big).
    b: uint8 &byte-order=spicy::ByteOrder::Little; # Use little byte order for this field.
} &byte-order=spicy::ByteOrder::Big;
```
