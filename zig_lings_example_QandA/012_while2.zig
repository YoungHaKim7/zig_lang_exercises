const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    var n: u32 = 2;

    while (n < 1000) : (n *= 2) {
        print("{} ", .{n});
    }

    print("n = {}\n", .{n});
}
