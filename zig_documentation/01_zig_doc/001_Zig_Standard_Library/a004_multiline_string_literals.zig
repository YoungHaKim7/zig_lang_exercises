const print = @import("std").debug.print;

pub fn main() void {
    const hello_world_in_c =
        \\#include <stdio.h>
        \\
        \\int main(int argc, char **argv) {
        \\    printf("hello world\n");
        \\    return 0;
        \\}
    ;
    print("{s}", .{hello_world_in_c});
}
