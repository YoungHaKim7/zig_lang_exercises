//! Zig Basics - Fundamental concepts demonstration
const std = @import("std");

// Constants
const PI = 3.14159;
const MAX_COUNT = 100;

// Variables and Data Types
pub fn demoVariables() void {
    // Integer types
    const unsigned: u8 = 255;
    const signed: i32 = -42;

    // Float types
    const float: f64 = 3.14;

    // Boolean
    const is_active: bool = true;

    // Strings (slices)
    const greeting: []const u8 = "Hello, Zig!";

    // Arrays
    const fixed_array: [5]i32 = .{1, 2, 3, 4, 5};

    std.debug.print("Variables: {d}, {d}, {d}, {s}, {any}\n", .{
        unsigned, signed, float, is_active, fixed_array
    });
}

// Functions
pub fn add(a: i32, b: i32) i32 {
    return a + b;
}

pub fn factorial(n: u32) u32 {
    if (n <= 1) return 1;
    return n * factorial(n - 1);
}

// Control flow
pub fn demoControlFlow(n: i32) void {
    // If-else
    if (n > 0) {
        std.debug.print("{d} is positive\n", .{n});
    } else if (n < 0) {
        std.debug.print("{d} is negative\n", .{n});
    } else {
        std.debug.print("{d} is zero\n", .{n});
    }

    // Switch
    const category = switch (n) {
        0...10 => "small",
        11...100 => "medium",
        else => "large",
    };
    std.debug.print("Category: {s}\n", .{category});

    // Loops
    var i: i32 = 0;
    while (i < 5) : (i += 1) {
        std.debug.print("While loop: {d}\n", .{i});
    }

    // For loop
    const arr = [_]i32{1, 2, 3, 4, 5};
    for (arr, 0..) |value, index| {
        std.debug.print("Index {d}: {d}\n", .{index, value});
    }
}

// Error handling
pub fn divide(a: f64, b: f64) !f64 {
    if (b == 0.0) {
        return error.DivisionByZero;
    }
    return a / b;
}

pub fn demoErrorHandling() !void {
    const result = divide(10.0, 2.0);
    std.debug.print("Division result: {d}\n", .{result});

    // Catching errors
    const result2 = divide(10.0, 0.0) catch 0.0;
    std.debug.print("Division with error catch: {d}\n", .{result2});
}

// Structs
pub const Point = struct {
    x: f64,
    y: f64,

    pub fn distance(self: Point, other: Point) f64 {
        const dx = self.x - other.x;
        const dy = self.y - other.y;
        return @sqrt(dx * dx + dy * dy);
    }

    pub fn format(self: Point, comptime fmt: []const u8, options: std.fmt.FormatOptions, writer: anytype) !void {
        _ = fmt;
        _ = options;
        try writer.print("Point({d:.2}, {d:.2})", .{self.x, self.y});
    }
};

// Enums
pub const Color = enum {
    red,
    green,
    blue,

    pub fn toHex(self: Color) []const u8 {
        return switch (self) {
            Color.red => "#FF0000",
            Color.green => "#00FF00",
            Color.blue => "#0000FF",
        };
    }
};

test "variables demo" {
    demoVariables();
}

test "math operations" {
    try std.testing.expectEqual(add(2, 3), 5);
    try std.testing.expectEqual(factorial(5), 120);
}

test "point distance" {
    const p1 = Point{ .x = 0.0, .y = 0.0 };
    const p2 = Point{ .x = 3.0, .y = 4.0 };
    const dist = p1.distance(p2);
    try std.testing.expectEqual(dist, 5.0);
}

test "error handling" {
    const result = try divide(10.0, 2.0);
    try std.testing.expectEqual(result, 5.0);

    const error_result = divide(10.0, 0.0);
    try std.testing.expectError(error.DivisionByZero, error_result);
}