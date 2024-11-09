# Result
- `zig run a001_constant_identifier_cannot_change.zig`

```bash
$ zig run a001_constant_identifier_cannot_change.zig

a001_constant_identifier_cannot_change.zig:6:7: error: cannot assign to constant
    y += 1;
    ~~^~~~
referenced by:
    main: a001_constant_identifier_cannot_change.zig:10:5
    callMain: /zig/lib/std/start.zig:514:17
    remaining reference traces hidden; use '-freference-trace' to see all reference traces

```

- `zig run a002_mutable_var.zig`

```bash
5679⏎

```
