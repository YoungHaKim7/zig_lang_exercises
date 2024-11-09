# Result

```bash
$ zig run a001_helloworld.zig

Hello, world Zig Lang~~⏎
```

- `zig run a002_values.zig`

```bash
$ zig run a002_values.zig

1 + 1 = 2
7.0 / 3.0 = 2.3333333e0
false
true
false

optional 1
type: ?[]const u8
value: null

optional 2
type: ?[]const u8
value: hi

error union 1
type: anyerror!i32
value: error.ArgNotFound

error union 2
type: anyerror!i32
value: 1234

```

- `zig run a003_string_literals.zig`

```bash
*const [5:0]u8
5
e
0
true
128169
128175
⚡
true
true
0xfe
0x9f
``````

- `zig run a004_multiline_string_literals.zig`

```bash
#include <stdio.h>

int main(int argc, char **argv) {
    printf("hello world\n");
    return 0;
}⏎

```
