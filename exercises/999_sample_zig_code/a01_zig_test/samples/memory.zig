//! Zig Memory Management and Collections
const std = @import("std");

// Allocator-based memory management
pub fn demoAllocator(allocator: std.mem.Allocator) !void {
    // Allocate a single integer
    var value = try allocator.create(i32);
    defer allocator.destroy(value);
    value.* = 42;
    std.debug.print("Allocated value: {d}\n", .{value.*});

    // Allocate an array
    var array = try allocator.alloc(i32, 5);
    defer allocator.free(array);

    for (array, 0..) |*item, i| {
        item.* = @intCast(i * 10);
    }

    std.debug.print("Array: {any}\n", .{array});
}

// ArrayList - Dynamic array
pub fn demoArrayList(allocator: std.mem.Allocator) !void {
    var list = std.ArrayList(i32).init(allocator);
    defer list.deinit();

    // Add elements
    try list.append(10);
    try list.append(20);
    try list.append(30);

    std.debug.print("ArrayList: {any}\n", .{list.items});
    std.debug.print("Length: {d}, Capacity: {d}\n", .{list.items.len, list.capacity});

    // Insert at position
    try list.insert(1, 15);
    std.debug.print("After insert: {any}\n", .{list.items});

    // Remove element
    const removed = list.orderedRemove(2);
    std.debug.print("Removed: {d}, List: {any}\n", .{removed, list.items});
}

// HashMap
pub fn demoHashMap(allocator: std.mem.Allocator) !void {
    var map = std.StringHashMap(i32).init(allocator);
    defer map.deinit();

    // Insert key-value pairs
    try map.put("apple", 5);
    try map.put("banana", 3);
    try map.put("cherry", 8);

    // Get value
    if (map.get("banana")) |count| {
        std.debug.print("Bananas: {d}\n", .{count});
    }

    // Iterate
    std.debug.print("\nAll fruits:\n", .{});
    var iter = map.iterator();
    while (iter.next()) |entry| {
        std.debug.print("  {s}: {d}\n", .{entry.key_ptr.*, entry.value_ptr.*});
    }

    // Update value
    if (map.getEntry("apple")) |entry| {
        entry.value_ptr.* += 2;
        std.debug.print("\nUpdated apple count: {d}\n", .{entry.value_ptr.*});
    }

    // Remove
    _ = map.remove("cherry");
    std.debug.print("After removing cherry, map has {d} entries\n", .{map.count()});
}

// String handling
pub fn demoStrings(allocator: std.mem.Allocator) !void {
    // String builder
    var buffer = std.ArrayList(u8).init(allocator);
    defer buffer.deinit();

    try buffer.appendSlice("Hello");
    try buffer.appendSlice(", ");
    try buffer.appendSlice("Zig!");

    const result = buffer.toOwnedSlice();
    defer allocator.free(result);

    std.debug.print("Built string: {s}\n", .{result});

    // String formatting
    var formatted = std.ArrayList(u8).init(allocator);
    defer formatted.deinit();

    try formatted.writer().print("The answer is: {d}", .{42});
    std.debug.print("Formatted: {s}\n", .{formatted.items});
}

// Arena Allocator - For bulk allocations
pub fn demoArenaAllocator(allocator: std.mem.Allocator) !void {
    var arena = std.heap.ArenaAllocator.init(allocator);
    defer arena.deinit();
    const arena_allocator = arena.allocator();

    // All allocations can be freed at once
    var list1 = std.ArrayList(i32).init(arena_allocator);
    var list2 = std.ArrayList(i32).init(arena_allocator);
    var map = std.StringHashMap(i32).init(arena_allocator);

    try list1.append(1);
    try list2.append(2);
    try map.put("key", 3);

    // No need to deinit individually - arena handles it
    std.debug.print("Arena: list1.len={d}, list2.len={d}, map.count={d}\n", .{
        list1.items.len, list2.items.len, map.count()
    });
}

// Memory Pool - For fixed-size allocations
pub fn demoMemoryPool(allocator: std.mem.Allocator) !void {
    // Create a pool for 64-byte blocks
    var pool = std.heap.MemoryPoolExtra(64, std.mem.Alignment).init(allocator);
    defer pool.deinit();

    // Allocate from pool
    var block1 = try pool.create([64]u8);
    var block2 = try pool.create([64]u8);

    block1[0] = 42;
    block2[0] = 100;

    std.debug.print("Pool blocks: {d}, {d}\n", .{block1[0], block2[0]});

    // Pool destroys all at once
}

// Custom allocator with logging
const LoggingAllocator = struct {
    parent_allocator: std.mem.Allocator,

    pub fn init(parent: std.mem.Allocator) LoggingAllocator {
        return .{ .parent_allocator = parent };
    }

    pub fn allocator(self: *LoggingAllocator) std.mem.Allocator {
        return .{ .ptr = self, .vtable = &.{ .alloc = alloc, .resize = resize, .free = free } };
    }

    fn alloc(ctx: *anyopaque, len: usize, ptr_align: u8, ret_addr: usize) ?[*]u8 {
        const self: *LoggingAllocator = @ptrCast(@alignCast(ctx));
        std.debug.print("ALLOC: {d} bytes, alignment: {d}\n", .{len, ptr_align});
        return self.parent_allocator.rawAlloc(len, ptr_align, ret_addr);
    }

    fn resize(ctx: *anyopaque, buf: []u8, buf_align: u8, new_len: usize, ret_addr: usize) bool {
        const self: *LoggingAllocator = @ptrCast(@alignCast(ctx));
        std.debug.print("RESIZE: {d} -> {d} bytes\n", .{buf.len, new_len});
        return self.parent_allocator.rawResize(buf, buf_align, new_len, ret_addr);
    }

    fn free(ctx: *anyopaque, buf: []u8, buf_align: u8, ret_addr: usize) void {
        const self: *LoggingAllocator = @ptrCast(@alignCast(ctx));
        std.debug.print("FREE: {d} bytes\n", .{buf.len});
        self.parent_allocator.rawFree(buf, buf_align, ret_addr);
    }
};

pub fn demoCustomAllocator(allocator: std.mem.Allocator) !void {
    var logging_allocator = LoggingAllocator.init(allocator);
    const logging = logging_allocator.allocator();

    var list = std.ArrayList(i32).init(logging);
    defer list.deinit();

    try list.append(1);
    try list.append(2);
    try list.append(3);

    std.debug.print("List created with logging allocator\n", .{});
}

test "allocator demo" {
    var gpa = std.testing.allocator;
    try demoAllocator(gpa);
}

test "arraylist demo" {
    var gpa = std.testing.allocator;
    try demoArrayList(gpa);
}

test "hashmap demo" {
    var gpa = std.testing.allocator;
    try demoHashMap(gpa);
}

test "strings demo" {
    var gpa = std.testing.allocator;
    try demoStrings(gpa);
}

test "arena allocator" {
    var gpa = std.testing.allocator;
    try demoArenaAllocator(gpa);
}

test "memory pool" {
    var gpa = std.testing.allocator;
    try demoMemoryPool(gpa);
}

test "custom allocator" {
    var gpa = std.testing.allocator;
    try demoCustomAllocator(gpa);
}