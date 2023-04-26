const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    defer print(" Two\n", .{});
    print("One", .{});
}
