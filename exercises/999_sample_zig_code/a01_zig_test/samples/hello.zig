//! Simple Hello World - Your first Zig program
const std = @import("std");

pub fn main() !void {
    // Basic printing
    std.debug.print("Hello, World!\n", .{});

    // Formatted printing
    const name = "Zig";
    const version = 1.0;
    std.debug.print("Welcome to {s} version {d:.1}!\n", .{name, version});

    // Different data types
    const integer: i32 = 42;
    const float: f64 = 3.14159;
    const boolean: bool = true;
    const text = "Programming";

    std.debug.print("Integer: {d}, Float: {d:.2}, Boolean: {}, Text: {s}\n", .{
        integer, float, boolean, text
    });

    // Arrays
    const numbers = [_]i32{1, 2, 3, 4, 5};
    std.debug.print("Numbers: {any}\n", .{numbers});

    // Loops
    std.debug.print("Counting: ", .{});
    for (numbers) |num| {
        std.debug.print("{d} ", .{num});
    }
    std.debug.print("\n", .{});

    // Functions
    const result = add(10, 20);
    std.debug.print("10 + 20 = {d}\n", .{result});

    // Error handling
    const division = divide(100.0, 5.0) catch 0.0;
    std.debug.print("100 / 5 = {d}\n", .{division});
}

fn add(a: i32, b: i32) i32 {
    return a + b;
}

fn divide(a: f64, b: f64) !f64 {
    if (b == 0.0) return error.DivisionByZero;
    return a / b;
}

// Tests
test "add function" {
    try std.testing.expectEqual(add(2, 3), 5);
}

test "divide function" {
    const result = try divide(10.0, 2.0);
    try std.testing.expectEqual(result, 5.0);
}

test "divide by zero" {
    const result = divide(10.0, 0.0);
    try std.testing.expectError(error.DivisionByZero, result);
}