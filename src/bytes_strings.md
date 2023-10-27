# Bytes and strings

The [`bytes`
type](https://docs.zeek.org/projects/spicy/en/latest/programming/language/types.html#bytes)
represents raw bytes, typically from protocol data. Literal are written with a
`b` prefix, e.g., `b"\x00byteData\x01"`.

The [`string`
type](https://docs.zeek.org/projects/spicy/en/latest/programming/language/types.html#string)
represents text in a given character set.

Conversion from some `bytes` to a `string` is always explicit with [`bytes`'
`decode`
method](https://docs.zeek.org/projects/spicy/en/latest/programming/language/types.html#method-bytes::decode).

```spicy
global my_bytes = b"abc";
global my_string = "abc";
global my_other_string = my_bytes.decode(); # Default: UTF-8.

print my_bytes, my_string, my_other_string;
```
