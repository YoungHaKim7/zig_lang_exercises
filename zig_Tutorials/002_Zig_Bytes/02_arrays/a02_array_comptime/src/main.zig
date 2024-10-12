const std = @import("std");
const print = std.debug.print;
const assert_debug = std.debug.assert;

pub fn main() !void {
    const array_one = [_]u32{ 1, 2, 3, 4 };
    const array_two = [_]u32{ 5, 6, 7, 8 };
    const both = array_one ++ array_two;
    print("both: print : {d}\n", .{both});
    comptime {
        assert_debug(std.mem.eql(u32, &both, &[_]u32{ 1, 2, 3, 4, 5, 6, 7, 8 }));
    }
}

test "simple test" {}
