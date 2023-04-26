const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    var i: u8 = 1;
    var stop_at: u8 = 16;

    while (i <= stop_at) : (i += 1) {
        if (i % 3 == 0) print("Fizz", .{});
        if (i % 5 == 0) print("Buzz", .{});
        if (!(i % 3 == 0) and !(i % 5 == 0)) {
            print("{}", .{i});
        }
        print(", ", .{});
    }
    print("\n ", .{});
}
