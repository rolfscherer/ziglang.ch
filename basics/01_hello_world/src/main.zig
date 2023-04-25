const std = @import("std");

pub fn main() !void {
    // Build and run the program via build.zip:
    // zig build run

    // Print "Hello, World" to stdout unbufferd.
    const stdout_file = std.io.getStdOut().writer();
    try stdout_file.print("Hello, World\n", .{});

    // Print "Hello again" to stdout bufferd.
    var bw = std.io.bufferedWriter(stdout_file);
    const stdout = bw.writer();
    try stdout.print("Hello again\n", .{});

    // flush the buffer
    try bw.flush();
}

test "simple test" {
    // Prints "Hello, World!" unbufferd to stderr.
    // Start the test with: zip build test
    std.debug.print("Hello, {s}!\n", .{"World"});
}
