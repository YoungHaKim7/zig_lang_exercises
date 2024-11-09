const std = @import("std");
const print = std.debug.print;

const @"identifier with space in it" = 0xff;
const @"1SmallStem4Man" = 112358;

const c = @import("std").c;
pub extern "c" fn @"error"() void;
pub extern "c" fn @"fstat$INODE64"(fd: c.fd_t, buf: *c.Stat) c_int;

pub fn main() void {
    const Color = enum {
        red,
        @"really red",
    };

    const color: Color = .@"really red";
    print("color : {}", .{color});
}
