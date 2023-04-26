const std = @import("std");
const print = std.debug.print;

const MyNumberError = error{
    TooSmall,
    TooBig,
};

pub fn main() void {
    var a: u32 = makeJustRight(44) catch 0;
    var b: u32 = makeJustRight(14) catch 0;
    var c: u32 = makeJustRight(4) catch 0;

    print("a={}, b={}, c={}\n", .{ a, b, c });
}

fn makeJustRight(n: u32) MyNumberError!u32 {
    return fixTooBig(n) catch |err| {
        return err;
    };
}

fn fixTooBig(n: u32) MyNumberError!u32 {
    return fixTooSmall(n) catch |err| {
        if (err == MyNumberError.TooBig) {
            return 20;
        }
        return err;
    };
}

fn fixTooSmall(n: u32) MyNumberError!u32 {
    return detectProblems(n);
}

fn detectProblems(n: u32) MyNumberError!u32 {
    if (n < 10) return MyNumberError.TooSmall;
    if (n > 20) return MyNumberError.TooBig;
    return n;
}
