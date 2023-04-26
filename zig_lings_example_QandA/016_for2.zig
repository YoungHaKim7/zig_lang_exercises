const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    const bits = [_]u8{ 1, 0, 1, 1 };
    var value: u32 = 0;

    for (bits) |bit, i| {
        var place_value = std.math.pow(u32, 2, @intCast(u32, i));
        value += place_value * bit;
    }
    print("The value of bits '1101 : {}.\n", .{value});
}
