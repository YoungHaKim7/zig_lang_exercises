const MyNumberError = error{
    TooBig,
    TooSmall,
    TooFour,
};

const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    const nums = [_]u8{ 2, 3, 4, 5, 6 };

    for (nums) |n| {
        print("{}", .{n});

        const number_error = numberFail(n);

        if (number_error == MyNumberError.TooBig) {
            print(">4. ", .{});
        }

        if (number_error == MyNumberError.TooSmall) {
            print("<4. ", .{});
        }
        if (number_error == MyNumberError.TooFour) {
            print("=4. ", .{});
        }
    }

    print("\n", .{});
}

fn numberFail(n: u8) MyNumberError {
    if (n > 4) return MyNumberError.TooBig;
    if (n < 4) return MyNumberError.TooSmall;
    return MyNumberError.TooFour;
}
