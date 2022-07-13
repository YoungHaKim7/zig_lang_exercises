const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    const le = [_]u8{ 1, 3 };
    const et = [_]u8{ 3, 7 };

    const leet = le ++ et;

    print("LEET: {any}\n", .{leet});

    const bit_pattern = [_]u8{ 1, 0, 0, 1 } ** 3;

    print("bit_pattern : {any}\n", .{bit_pattern});

    for (leet) |n| {
        print("{}\n", .{n});
    }

    for (bit_pattern) |n| {
        print("{}\n", .{n});
    }

    print("\n", .{});
}
