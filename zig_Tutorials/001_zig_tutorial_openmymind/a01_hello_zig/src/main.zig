const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    const user = User{
        .power = 9901,
        .name = "Goku",
    };
    print("{s}'s power is {d}\n", .{ user.name, user.power });
}

pub const User = struct {
    power: u64,
    name: []const u8,
};

test "simple test" {}
