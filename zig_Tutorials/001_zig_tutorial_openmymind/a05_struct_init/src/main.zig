const std = @import("std");
const print = std.debug.print;

pub const MAX_POWER = 100_000;

pub const User = struct {
    power: u64 = 0,
    name: []const u8,

    pub const SUPER_POWER = 9000;

    pub fn diagnose(user: User) void {
        if (user.power >= SUPER_POWER) {
            print("it's over {d}!!!", .{SUPER_POWER});
        }
    }
};

pub fn init(name: []const u8, power: u64) User {
    return .{
        .name = name,
        .power = power,
    };
}

pub fn main() void {
    const user = User{
        .power = 12_000,
        .name = "Goku",
    };

    const user2 = User{
        .power = 11_000,
        .name = "G_Young",
    };

    user.diagnose();

    // The above is syntactical sugar for:
    User.diagnose(user);

    user2.diagnose();
    User.diagnose(user2);
}

test "simple test" {}
