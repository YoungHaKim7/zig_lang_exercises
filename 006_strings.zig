const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    const ziggy = "stardust";

    const d: u8 = ziggy[5];

    const laugh = "ha " ** 3;

    const major = "Major";
    const tom = "Tom";
    const major_tom = major ++ tom;

    print("d = {d}\n {s}\n{s}\n", .{ d, laugh, major_tom });
}
