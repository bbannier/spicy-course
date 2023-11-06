# Parsing types

Spicy parsers are build up from smaller parsers, at the lowest level from basic types present in the input.

Currently Spicy [supports parsing for the following basic
types](https://docs.zeek.org/projects/spicy/en/latest/programming/parsing.html#parsing-types):

- [network
  addresses](https://docs.zeek.org/projects/spicy/en/latest/programming/parsing.html#address)
- [bitfields](https://docs.zeek.org/projects/spicy/en/latest/programming/parsing.html#bitfield)
- [raw bytes](https://docs.zeek.org/projects/spicy/en/latest/programming/parsing.html#bytes)
- [integers](https://docs.zeek.org/projects/spicy/en/latest/programming/parsing.html#integer)
- [floating point
  numbers](https://docs.zeek.org/projects/spicy/en/latest/programming/parsing.html#real)
- [regular expressions](https://docs.zeek.org/projects/spicy/en/latest/programming/parsing.html#regular-expression)
- [lists](https://docs.zeek.org/projects/spicy/en/latest/programming/parsing.html#vector)

Fields not extracting or containing any data can be marked `void`.
