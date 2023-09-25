const std = @import("std");
const print = std.debug.print;

pub const MAX_POWER = 100_000;

pub const User = struct {
    power: u64 = 0,
    name: []const u8,

    pub const SUPER_POWER = 9000;

    pub fn diagnose(user: User) void {
        if (user.power >= SUPER_POWER) {
            print("it's over {d}!!!\n", .{SUPER_POWER});
        }
    }
};

pub fn init(user: User) User {
    return .{
        .name = user.name,
        .power = user.power,
    };
}

pub fn main() void {
    const user = User{
        .power = 12_000,
        .name = "Goku",
    };

    // Call the diagnose() function on the original user struct.
    user.diagnose();

    // Initialize a new user struct using the original user struct.
    const new_user = init(user);

    // Call the diagnose() function on the new user struct.
    new_user.diagnose();
}
