const std = @import("std");
const print = std.debug.print;
const expect = std.testing.expect;

fn add(a: i32, b: i32) i32 {
    return a + b;
}

pub fn main() void {
    const x: i32 = add(12, 34);
    const y: i32 = add(10, x);

    print("{}", .{y});
}

test "container level variables" {
    const x: i32 = add(12, 34);
    const y: i32 = add(10, x);
    try expect(x == 46);
    try expect(y == 56);
}
