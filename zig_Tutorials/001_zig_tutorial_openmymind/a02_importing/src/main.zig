const std = @import("std");
const user = @import("models/user.zig").User;
const User = user.User;
const MAX_POWER = user.MAX_POWER;

pub fn main() void {
    const b = user{
        .power = 9001,
        .name = "Gyoung",
    };

    std.debug.print("{s}'s power is {d}\n", .{ b.name, b.power });
}

test "simple test" {}
