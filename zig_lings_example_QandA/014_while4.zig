const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    var n: u32 = 1;

    while (true) : (n += 1) {
        if (n == 4) break;
    }

    print("n = {}\n", .{n});
}
