const std = @import("std");

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    try stdout.print("Hello, {s}! zig !~~~\n", .{"world"});
}

test "simple test" {}

test "fuzz example" {}
