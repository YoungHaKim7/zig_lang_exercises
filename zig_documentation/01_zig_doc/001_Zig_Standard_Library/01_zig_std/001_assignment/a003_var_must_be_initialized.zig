const print = @import("std").debug.print;

pub fn main() void {
    var x: i32;

    x =  1;

    print("{d}", .{x});
}
