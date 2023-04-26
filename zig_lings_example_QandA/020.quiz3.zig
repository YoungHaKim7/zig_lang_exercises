const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    const my_numbers = [4]u16{ 5, 6, 7, 8 };

    printPowersOfTwo(my_numbers);
    print("\n", .{});
}

fn printPowersOfTwo(numbers: [4]u16) void {
    for (numbers) |n| {
        print("{} ", .{twoToThe(n)});
    }
}

fn twoToThe(number: u16) u16 {
    var n: u16 = 0;
    var total: u16 = 1;

    while (n < number) : (n += 1) {
        total *= 2;
    }

    return total;
}
