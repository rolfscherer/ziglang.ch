const print = @import("std").debug.print;
const x = 1234;

fn foo() u32 {
    // It works at file scope as well as inside functions.
    const y = 5678;

    // Once assigned, an identifier cannot be changed.
    // The next line would generate a build error
    // y += 1;
    // constant_identifier_cannot_change.zig:9:7: error: cannot assign to constant

    return y;
}

fn bar() void {
    var y: i32 = 5678;

    y += 1;

    print("{d}", .{y});
}

pub fn main() void {
    _ = foo();
    bar();
}
