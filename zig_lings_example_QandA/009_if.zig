const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    const foo = 1;

    if (foo == 1) {
        print("Foo is 1!\n", .{});
    } else {
        print("Foo is not 1!\n", .{});
    }
}
