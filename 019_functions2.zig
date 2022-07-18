const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    print("Powers of two: {} {} {} {}\n", .{
        twoToThe(1),
        twoToThe(2),
        twoToThe(3),
        twoToThe(4),
    });
}

// Please give this function the correct input parameter(s).
// You'll need to figure out the parameter name and type that we're
// expecting. The output type has already been specified for you.
//
fn twoToThe(my_number: u32) u32 {
    return std.math.pow(u32, 2, my_number);
}
