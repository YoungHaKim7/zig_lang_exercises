//! By convention, main.zig is where your main function lives in the case that
//! you are building an executable. If you are making a library, the convention
//! is to delete this file and start with root.zig instead.
const std = @import("std");
const print = std.debug.print;

pub fn main() !void {
    const name: []const u8 = "Zig Dog";

    var count: u32 = 0;
    count += 1;

    print("const name : {s}\n", .{name});
    print("count : {}", .{count});
}

test "simple test" {
    // var list = std.ArrayList(i32).init(std.testing.allocator);
    // defer list.deinit(); // Try commenting this out and see if zig detects the memory leak!
    // try list.append(42);
    // try std.testing.expectEqual(@as(i32, 42), list.pop());
}

test "fuzz example" {
    // // Try passing `--fuzz` to `zig build` and see if it manages to fail this test case!
    // const input_bytes = std.testing.fuzzInput(.{});
    // try std.testing.expect(!std.mem.eql(u8, "canyoufindme", input_bytes));
}
