const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    const constant: i32 = 5;
    print("Hello, {s}!\n", .{"World zig lang"});
    print("constant ,{}", .{constant});
}
