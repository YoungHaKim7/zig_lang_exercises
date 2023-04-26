// https://ziglang.org/documentation/0.9.1/#Error-Union-Type

const std = @import("std");
const print = std.debug.print;

const MyNumberError = error{TooSmall};

pub fn main() void {
    var a: u32 = addTwenty(44) catch 22;
    var b: u32 = addTwenty(4) catch 22;

    print("a={}, b={}\n", .{ a, b });
}

fn addTwenty(n: u32) !u32 {
    if (n < 5) {
        return MyNumberError.TooSmall;
    } else {
        return n + 20;
    }
}
