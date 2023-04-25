const std = @import("std");

pub fn main() !void {
    // Build and run the program via build.zig:
    // zig build run

    // Print "Hello, World" to stdout unbufferd.
    const stdout = std.io.getStdOut().writer();
    try stdout.print("Hello, World\n", .{});

    // Print "Hello again" to stdout bufferd.
    var bw = std.io.bufferedWriter(stdout);
    const stdout_writer = bw.writer();
    try stdout_writer.print("Hello again\n", .{});

    // Flush the buffer
    try bw.flush();
}

test "simple test" {
    // Prints "Hello, World!" unbufferd to stderr.
    // Start the test with: zip build test
    std.debug.print("Hello, {s}!\n", .{"World"});
}
