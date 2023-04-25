//! This code provides a function to say "Hello, World"

/// A doc comment is one that begins with exactly three slashes
const print = @import("std").debug.print;

pub fn main() void {
    // Comments in Zig start with "//" and end at the next LF byte (end of line).

    // The line below is a comment and won't be executed.
    //print("Hello?", .{});

    print("Hello, world!\n", .{}); // another comment
}
