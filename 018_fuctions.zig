const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    const answer: u8 = deepThought();

    print("Answer to the Ultimate Question: {}\n", .{answer});
}

pub fn deepThought() u8 {
    return 42;
}
