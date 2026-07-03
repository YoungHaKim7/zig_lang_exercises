//! Advanced Zig Features - Generics, Files, and more
const std = @import("std");

// Generic types (using anytype)
pub fn genericSwap(comptime T: type, a: *T, b: *T) void {
    const temp = a.*;
    a.* = b.*;
    b.* = temp;
}

pub fn genericMax(comptime T: type, a: T, b: T) T {
    return if (a > b) a else b;
}

// Generic data structure
pub fn Stack(comptime T: type) type {
    return struct {
        const Self = @This();
        items: std.ArrayList(T),

        pub fn init(allocator: std.mem.Allocator) Self {
            return .{ .items = std.ArrayList(T).init(allocator) };
        }

        pub fn deinit(self: *Self) void {
            self.items.deinit();
        }

        pub fn push(self: *Self, item: T) !void {
            try self.items.append(item);
        }

        pub fn pop(self: *Self) ?T {
            if (self.items.popOrNull()) |item| {
                return item;
            }
            return null;
        }

        pub fn isEmpty(self: *const Self) bool {
            return self.items.items.len == 0;
        }
    };
}

// File I/O operations
pub fn demoFileRead(allocator: std.mem.Allocator, path: []const u8) ![]u8 {
    const file = try std.fs.cwd().openFile(path, .{});
    defer file.close();

    const stat = try file.stat();
    const contents = try file.reader().readAllAlloc(allocator, stat.size);
    return contents;
}

pub fn demoFileWrite(path: []const u8, content: []const u8) !void {
    const file = try std.fs.cwd().createFile(path, .{ .read = true });
    defer file.close();

    try file.writeAll(content);
    std.debug.print("Written to {s}\n", .{path});
}

pub fn demoFileAppend(path: []const u8, content: []const u8) !void {
    const file = try std.fs.cwd().openFile(path, .{ .mode = .write_only });
    defer file.close();

    try file.seekFromEnd(0);
    try file.writeAll(content);
    std.debug.print("Appended to {s}\n", .{path});
}

// Directory operations
pub fn demoDirectoryOps(allocator: std.mem.Allocator, dir_path: []const u8) !void {
    var dir = try std.fs.cwd().openIterableDir(dir_path, .{});
    defer dir.close();

    var walker = try dir.walk(allocator);
    defer walker.deinit();

    std.debug.print("Walking directory {s}:\n", .{dir_path});

    while (try walker.next()) |entry| {
        const kind = switch (entry.kind) {
            .file => "FILE",
            .directory => "DIR ",
            .sym_link => "LINK",
            else => "OTHER",
        };

        std.debug.print("  [{s}] {s}\n", .{kind, entry.basename});
    }
}

// JSON parsing and serialization
pub const Person = struct {
    name: []const u8,
    age: u32,
    email: ?[]const u8,

    pub fn jsonParse(allocator: std.mem.Allocator, source: anytype, options: std.json.ParseOptions) !@This() {
        return try std.json.parseFromTokenSourceLeaky(@This(), allocator, source, options);
    }

    pub fn jsonStringify(self: *const @This(), writer: anytype) !void {
        try std.json.stringify(self, .{}, writer);
    }
};

pub fn demoJson(allocator: std.mem.Allocator) !void {
    const json_str = \\
        \\{
        \\  "name": "Alice",
        \\  "age": 30,
        \\  "email": "alice@example.com"
        \\}
    ;

    var stream = std.json.TokenStream.init(json_str);
    const person = try std.json.parseFromTokenSource(Person, allocator, &stream, .{});
    defer person.deinit();

    std.debug.print("Parsed Person: {s}, age {d}\n", .{person.value.name, person.value.age});

    // Serialize back to JSON
    var buffer = std.ArrayList(u8).init(allocator);
    defer buffer.deinit();

    try std.json.stringify(person.value, .{}, buffer.writer());
    std.debug.print("Serialized JSON: {s}\n", .{buffer.items});
}

// Comptime features
pub fn comptimeDemo() void {
    // Comptime integers
    const size: comptime_int = 100;
    const arr: [size]u8 = undefined;

    std.debug.print("Array size: {d}\n", .{arr.len});

    // Comptime strings
    const greet = comptime "Hello";
    const combined = comptime greet ++ ", Zig!";

    std.debug.print("Combined: {s}\n", .{combined});

    // Comptime loops
    const sum = comptime blk: {
        var result: i32 = 0;
        for (1..11) |i| {
            result += i;
        }
        break :blk result;
    };

    std.debug.print("Comptime sum 1..10: {d}\n", .{sum});
}

// Type information
pub fn typeInfoDemo() void {
    const T = i32;
    const info = @typeInfo(T);

    std.debug.print("Type info for:\n", .{});

    switch (info) {
        .Int => |int_info| {
            std.debug.print("  Integer: bits={d}, signed={}\n", .{int_info.bits, int_info.signed});
        },
        .Float => |float_info| {
            std.debug.print("  Float: bits={d}\n", .{float_info.bits});
        },
        else => {
            std.debug.print("  Other type\n", .{});
        }
    }
}

// Built-in functions
pub fn builtinDemo() void {
    const value: i32 = 42;

    // Type size
    std.debug.print("Size of i32: {d} bytes\n", .{@sizeOf(i32)});

    // Type alignment
    std.debug.print("Alignment of i32: {d} bytes\n", .{@alignOf(i32)});

    // Maximum/minimum
    std.debug.print("i32 max: {d}, min: {d}\n", .{@TypeOf(value).max, @TypeOf(value).min});

    // Type casting
    const as_float: f64 = @floatFromInt(value);
    std.debug.print("As float: {d}\n", .{as_float});

    // Error set
    const ErrorSet = error{FileNotFound, PermissionDenied};
    std.debug.print("Error set count: {d}\n", .{@typeInfo(ErrorSet).ErrorSet.?.len});
}

// Inline assembly (platform-specific)
pub fn asmDemo() void {
    const x: u32 = 10;
    const y: u32 = 20;

    // Simple inline assembly for x86_64
    const result = asm (
        \\addl %%ebx, %%eax
        : [retval] "={eax}" (-> u32),
        : [a] "{eax}" (x),
          [b] "{ebx}" (y)
    );

    std.debug.print("ASM result: {d}\n", .{result});
}

// Reflection
pub fn getFieldNames(comptime T: type) []const []const u8 {
    return std.meta.fieldNames(T);
}

pub const DemoStruct = struct {
    field1: i32,
    field2: []const u8,
    field3: bool,
};

test "generics" {
    var a: i32 = 5;
    var b: i32 = 10;
    genericSwap(i32, &a, &b);
    try std.testing.expectEqual(a, 10);

    const max = genericMax(i32, 42, 99);
    try std.testing.expectEqual(max, 99);
}

test "stack" {
    var gpa = std.testing.allocator;
    var stack = Stack(i32).init(gpa);
    defer stack.deinit();

    try stack.push(1);
    try stack.push(2);
    try stack.push(3);

    try std.testing.expectEqual(stack.pop().?, 3);
    try std.testing.expectEqual(stack.pop().?, 2);
    try std.testing.expect(stack.isEmpty() == false);
}

test "json" {
    var gpa = std.testing.allocator;
    try demoJson(gpa);
}

test "comptime" {
    comptimeDemo();
}

test "type info" {
    typeInfoDemo();
}

test "builtins" {
    builtinDemo();
}

test "field names" {
    const names = getFieldNames(DemoStruct);
    try std.testing.expectEqual(names.len, 3);
    try std.testing.expectEqualStrings(names[0], "field1");
}