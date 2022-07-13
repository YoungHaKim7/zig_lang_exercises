const std = @import("std");

pub fn main() void {
    var n: u8 = 50;
    n = n + 5;

    const pi: u32 = 314159;

    const negative_eleven: i8 = -11;

    // There are no errors in the next line, just explanation:
    // Perhaps you noticed before that the print function takes two
    // parameters. Now it will make more sense: the first parameter
    // is a string. The string may contain placeholders '{}', and the
    // second parameter is an "anonymous list literal" (don't worry
    // about this for now!) with the values to be printed.
    std.debug.print("{} {} {}\n", .{ n, pi, negative_eleven });
}
