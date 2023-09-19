# Result

```
$ zig build run                                                                                                                ─╯
1 + 1 = 2
7.0 / 3.0 = 2.33333325e+00
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
