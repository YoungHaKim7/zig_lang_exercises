const std = @import("std");
const print = std.debug.print;

pub fn main() void {
    var discount = true;

    var price: u8 = if (discount) 17 else 20;

    print("With the discount, the price is ${}.\n", .{price});
}
