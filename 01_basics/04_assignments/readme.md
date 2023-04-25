# Comments

Build and run the program:</br>
`zig build run`

Value assignment has the following syntax: (const|var) identifier[: type] = value.

<ol>
<li> const indicates that identifier is a constant that stores an immutable value.</li>
<li> var indicates that identifier is a variable that stores a mutable value.</li>
<li> : type is a type annotation for identifier, and may be omitted if the data type of value can be inferred.</li>
</ol>

## Constant indentifier

Use the const keyword to assign a value to an identifier:

```
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
```

## Mutable variables

If you need a variable that you can modify, use the var keyword:

```
const print = @import("std").debug.print;

pub fn main() void {
    var y: i32 = 5678;

    y += 1;

    print("{d}", .{y});
}
```

Variables must be initialized:
```
pub fn main() void {
    var x: i32;

    x = 1;
}
```
Output:
```
$ zig build-exe main.zig
var_must_be_initialized.zig:2:5: error: variables must be initialized
    var x: i32;
    ^~~~~~~~~~
```


## undefined

Use undefined to leave variables uninitialized:

```
const print = @import("std").debug.print;

pub fn main() void {
    var x: i32 = undefined;
    x = 1;
    print("{d}", .{x});
}
```