const std = @import("std");
const print = std.debug.print;

const MyNumberError = error{TooSmall};

pub fn main() void {
    var my_number: MyNumberError!u8 = 5;

    my_number = MyNumberError.TooSmall;

    print("I compiled!\n", .{});
}
