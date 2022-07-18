const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    const lyrics =
        \\ Ziggy played guitar
        \\ Jamming good with Andrew Kellyey
        \\ And the Spiders from Mars
    ;

    print("{s}\n", .{lyrics});
}
