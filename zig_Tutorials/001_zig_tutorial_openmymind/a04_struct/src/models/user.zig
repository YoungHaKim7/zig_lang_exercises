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
