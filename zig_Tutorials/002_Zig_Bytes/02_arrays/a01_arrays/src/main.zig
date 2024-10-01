const std = @import("std");
const print = std.debug.print;

pub fn main() !void {
    // Array Literal
    const hello = [_]u8{ 'H', 'e', 'l', 'l', 'o' };

    // Result Location
    const alt_hello: [5]u8 = .{ 'H', 'e', 'l', 'l', 'o' };

    // String Literal
    const same_hello = "Hello";

    print("Array Literal : {d}\n", .{hello});
    print("Result Location : {d}\n", .{alt_hello});
    print("String Literal : {d}\n", .{same_hello});
}

test "simple test" {}
