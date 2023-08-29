# Why Spicy?

Historically adding new parsers to Zeek required writing C++ code which was
error-prone and a significant barrier to entry.

```bob

.-----.
|asdas|----+->
'-----'    |___



Spicy --> HILTI --> "C++" --> HLTO
```

```bob
    0       3
     *-------*      +y
  1 /|    2 /|       ^
   *-------* |       |
   | |4    | |7      | ◄╮
   | *-----|-*     ⤹ +-----> +x
   |/      |/       / ⤴
   *-------*       v
  5       6      +z
```

```admonish tip
My example is the best!
```

```markdown
{{#include SUMMARY.md}}
```

```console
$ bat SUMMARY.md 1 2 -f
<!-- cmdrun bat SUMMARY.md -->
```
