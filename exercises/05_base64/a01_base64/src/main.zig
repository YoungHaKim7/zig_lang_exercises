const std = @import("std");
const a01_base64 = @import("a01_base64");

fn base64_encode(allocator: std.mem.Allocator, input: []const u8) ![]const u8 {
    const alphabet_chars =
        "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-+"[0..64].*;
    var encoder = std.base64.Base64Encoder.init(alphabet_chars, '=');

    const size = encoder.calcSize(input.len);
    const buf = try allocator.alloc(u8, size);
    const result = encoder.encode(buf, input);

    return result;
}

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();

    const result = try base64_encode(allocator, "h");

    std.debug.print("h __result : {s}\n", .{result});

    const result02 = try base64_encode(allocator, "hello");
    std.debug.print("hello ___result02 : {s}\n", .{result02});
}

test "simple test" {}

test "fuzz example" {}
