const std = @import("std");
const print = std.debug.print;

const MyNumberError = error{
    TooSmall,
    TooBig,
};

pub fn main() void {
    var a: u32 = addFive(44) catch 0;
    var b: u32 = addFive(14) catch 0;
    var c: u32 = addFive(4) catch 0;

    print("a={}, b={}, c={} \n", .{ a, b, c });
}

fn addFive(n: u32) MyNumberError!u32 {
    var x = try detect(n);

    return x + 5;
}

fn detect(n: u32) MyNumberError!u32 {
    if (n < 10) return MyNumberError.TooSmall;
    if (n > 20) return MyNumberError.TooBig;
    return n;
}
