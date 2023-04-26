const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    var n: u32 = 2;

    while (n < 1024) {
        print("{} ", .{n});

        n *= 2;
    }

    print("n = {}\n", .{n});
}
