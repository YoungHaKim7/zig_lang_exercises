const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    const story = [_]u8{ 'h', 'h', 's', 'n', 'h' };

    print("A Dramatic Story: ", .{});

    for (story) |scene| {
        if (scene == 'h') print(":-) ", .{});
        if (scene == 's') print(":-(", .{});
        if (scene == 'n') print(":-| ", .{});
    }

    print("The End. \n", .{});
}
