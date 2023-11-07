# Structure of a parser

A parser contains a potentially empty ordered list of subparsers which are
invoked in order.

```spicy
type Version = unit {
    major: uint32;
    minor: uint32;
    patch: uint32;
};
```

## Attributes

Behavior of individual subparsers or units can be controlled with attributes.
See the [documentation of the concrete
types](https://docs.zeek.org/projects/spicy/en/latest/programming/parsing.html#parsing-types)
for the supported attributes.

```spicy
type Version = unit {
    major: bytes &until=b".";
    minor: bytes &until=b".";
    patch: bytes &eod;
} &convert="v%s.%s.%s" % (self.major, self.minor, self.patch);
```

## Extracting data without storing it

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

## Hooks

We can hook into parsing via [unit or field hooks](https://docs.zeek.org/projects/spicy/en/latest/programming/parsing.html#unit-hooks).

In hooks we can refer to the current unit via `self`, and the current field via
`$$`. We can declare multiple hooks for the same field/unit.

```spicy
public type X = unit {
    x: uint8 { print "a=%d" % self.x; }

    on %done { print "X=%s" % self; }
};

on X::x {
    print "Done parsing a=%d" % $$;
}
```

## Conditional parsing

During parsing we might want to decide at runtime what to parse next, e.g.,
certain fields might only be set if a previous field has a certain value, or the
type for the next field might be set by a previous field.

We can [specify that a field should only be parsed if a condition is
met](https://docs.zeek.org/projects/spicy/en/latest/programming/parsing.html#conditional-parsing).

```spicy
type Integer = unit {
    width: uint8 &requires=($$ != 0 && $$ < 8);
    u8 : uint8  if (self.width == 1);
    u16: uint16 if (self.width == 2);
    u32: uint32 if (self.width == 3);
    u64: uint64 if (self.width == 4);
};
```

Alternatively we can express this with a [unit switch
statement](https://docs.zeek.org/projects/spicy/en/latest/programming/parsing.html#parse-switch).

```spicy
type Integer = unit {
    width: uint8 &requires=($$ != 0 && $$ < 8);
    switch (self.width) {
        1 -> u8: uint8;
        2 -> u16: uint16;
        3 -> u32: uint32;
        4 -> u64: uint64;
    };
};
```

In both cases the unit will include all fields, both set and unset. Once can
query whether a field has been set with
[`?.`](https://docs.zeek.org/projects/spicy/en/latest/programming/language/types.html#operator-unit::HasMember),
e.g.,

```spicy
on Integer::%done {
    if (self?.u8) { print "u8 was extracted"; }
}
```

## Controlling byte order

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
    # Use default byte order (big).
    a: uint8;

    # Use little byte order for this field.
    b: uint8 &byte-order=spicy::ByteOrder::Little;
} &byte-order=spicy::ByteOrder::Big;
```

Often parsing requires examining input and dynamically choosing a matching
parseq. Spicy models this with lookahead parsing which is explained in a later
chapter.
