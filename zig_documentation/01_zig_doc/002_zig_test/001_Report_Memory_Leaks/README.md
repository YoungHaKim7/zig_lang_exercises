# Result

```bash
$ zig test a001_testing_detect_leak.zig

[gpa] (err): memory address 0x100a60000 leaked:
/zig/lib/std/array_list.zig:457:67: 0x10093105f in ensureTotalCapacityPrecise (test)
                const new_memory = try self.allocator.alignedAlloc(T, alignment, new_capacity);
                                                                  ^
/zig/lib/std/array_list.zig:434:51: 0x100906bbb in ensureTotalCapacity (test)
            return self.ensureTotalCapacityPrecise(better_capacity);
                                                  ^
/zig/lib/std/array_list.zig:483:41: 0x1008fd64f in addOne (test)
            try self.ensureTotalCapacity(newlen);
                                        ^
/zig/lib/std/array_list.zig:262:49: 0x1008fa2f7 in append (test)
            const new_item_ptr = try self.addOne();
                                                ^
/a001_testing_detect_leak.zig:7:20: 0x1008f8943 in test.detect leak (test)
    try list.append('☔');
                   ^
/zig/lib/compiler/test_runner.zig:157:25: 0x1009042db in mainTerminal (test)
        if (test_fn.func()) |_| {
                        ^
/zig/lib/compiler/test_runner.zig:37:28: 0x1008fa9df in main (test)
        return mainTerminal();
                           ^
/zig/lib/std/start.zig:514:22: 0x1008fa5ab in main (test)
            root.main();
                     ^
???:?:?: 0x18cdd8273 in ??? (???)

All 1 tests passed.
1 errors were logged.
1 tests leaked memory.
error: the following test command failed with exit code 1:
/.cache/zig/o/88f5dcfe98bcf3f7762fa8e49210175a/test
```
