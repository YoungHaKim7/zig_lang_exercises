const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    var n: u32 = 1;

    while (n < 20) : (n += 1) {
        if (n % 3 == 0) continue;
        if (n % 5 == 0) continue;
        print("{} ", .{n});
    }

    print("n = {}\n", .{n});
}
