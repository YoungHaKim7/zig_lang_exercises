const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    const animals = [_]u8{ 'g', 'c', 'd', 'd', 'g', 'z' };

    for (animals) |a| printAnimal(a);

    print("done.\n", .{});
}

fn printAnimal(animal: u8) void {
    print("(", .{});

    defer print(") ", .{});
    if (animal == 'g') {
        print("Goat", .{});
        return;
    }
    if (animal == 'c') {
        print("Cat", .{});
        return;
    }
    if (animal == 'd') {
        print("Dog", .{});
        return;
    }

    print("Unknown", .{});
}
