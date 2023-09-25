const std = @import("std");
const print = std.debug.print;

fn add(a: i64, b: i64) i64 {
    return a + b;
}

pub fn main() !void {
    const sum = add(8999, 2);
    print("8999 + 2 = {d}\n", .{sum});
    // c언어는 %d
}

test "simple test" {}
