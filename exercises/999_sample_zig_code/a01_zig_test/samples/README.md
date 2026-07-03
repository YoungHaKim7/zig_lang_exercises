# Zig Sample Code Collection

Welcome to the Zig sample code collection! This directory contains various examples demonstrating Zig programming concepts.

## 📁 Sample Files

### 1. **hello.zig** - Hello World & Basics
The perfect starting point for beginners. Covers:
- Basic printing and formatting
- Data types (integers, floats, booleans, strings)
- Arrays and loops
- Functions and error handling
- Basic testing

**Run it:**
```bash
zig run samples/hello.zig
```

### 2. **basics.zig** - Fundamental Concepts
Comprehensive introduction to Zig basics:
- Variables and data types
- Functions (including recursion)
- Control flow (if-else, switch, loops)
- Error handling with try/catch
- Structs and methods
- Enums and pattern matching

**Run tests:**
```bash
zig test samples/basics.zig
```

### 3. **memory.zig** - Memory Management & Collections
Advanced memory management in Zig:
- Allocator usage
- ArrayList (dynamic arrays)
- HashMap (key-value storage)
- String manipulation
- Arena allocators
- Memory pools
- Custom allocators

**Run tests:**
```bash
zig test samples/memory.zig
```

### 4. **advanced.zig** - Advanced Features
Complex Zig programming patterns:
- Generic programming with `anytype`
- Generic data structures
- File I/O operations
- JSON parsing/serialization
- Comptime evaluation
- Type introspection
- Built-in functions
- Reflection

**Run tests:**
```bash
zig test samples/advanced.zig
```

## 🚀 Quick Start

1. **Run a single file:**
```bash
zig run samples/hello.zig
```

2. **Run tests:**
```bash
zig test samples/basics.zig
```

3. **Build the main project:**
```bash
zig build
```

4. **Run the project:**
```bash
zig build run
```

5. **Run all tests:**
```bash
zig build test
```

## 📚 Key Zig Concepts Demonstrated

### Memory Safety
- Manual memory management with allocators
- No hidden allocations
- Compile-time memory leak detection

### Error Handling
- Error unions (`!Type`)
- try/catch for error propagation
- No exceptions - explicit error handling

### Generic Programming
- `anytype` for generic functions
- `comptime` for compile-time evaluation
- Zero-cost abstractions

### Performance
- No hidden allocations
- Direct memory access
- Inline assembly when needed

### Testing
- Built-in test framework
- Tests next to code
- Easy to run and maintain

## 💡 Learning Path

1. **Start with:** `hello.zig`
2. **Then:** `basics.zig`
3. **Next:** `memory.zig`
4. **Finally:** `advanced.zig`

Each file builds on concepts from the previous ones.

## 🛠️ Project Structure

```
a01_zig_test/
├── src/
│   ├── main.zig          # Entry point
│   └── root.zig          # Library exports
├── samples/              # Sample code (this directory)
│   ├── hello.zig        # Simple examples
│   ├── basics.zig       # Fundamentals
│   ├── memory.zig       # Memory management
│   └── advanced.zig     # Advanced features
└── build.zig            # Build configuration
```

## 📖 Zig Resources

- **Official Docs:** https://ziglearn.org/
- **Standard Library:** https://ziggit.org/zig-standard-library/
- **Community:** https://ziglang.org/community/

## 🎯 Common Patterns

### Printing
```zig
std.debug.print("Value: {d}\n", .{value});
```

### Error Handling
```zig
const result = try mightFail();
// or
const result = mightFail() catch defaultValue;
```

### Memory Allocation
```zig
var list = std.ArrayList(i32).init(allocator);
defer list.deinit();
```

### Loops
```zig
// While
while (condition) {
    // body
}

// For
for (items, 0..) |item, index| {
    // use item and index
}
```

## 🧪 Testing

Tests are embedded in Zig files using the `test` keyword:

```zig
test "test name" {
    try std.testing.expectEqual(expected, actual);
}
```

Run all tests in a file:
```bash
zig test filename.zig
```

## 💬 Tips

1. **Use `defer`** for cleanup - it runs when scope exits
2. **Use `try`** for error propagation
3. **Use `comptime`** for compile-time computation
4. **Use `anytype`** for generic functions
5. **Always test** with different optimization levels

Enjoy learning Zig! 🚀