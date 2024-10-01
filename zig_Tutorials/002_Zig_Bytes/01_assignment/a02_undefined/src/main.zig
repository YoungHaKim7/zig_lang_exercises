const std = @import("std");
const print = std.debug.print;

pub fn main() !void {
    const undefined_const: i32 = undefined;
    print("const undefined_const = {d}\n", .{undefined_const});

    var undefined_var: i32 = undefined;

    undefined_var = -1;
    print("var undefined_var = {d}\n", .{undefined_var});
}

test "simple test" {}
