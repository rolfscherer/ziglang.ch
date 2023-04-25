# Comments

Build and run the program:</br>
`zig build run`

## Single line comment
Comments in Zig start with "//" and end at the next LF byte (end of line).

`\\ This line is a comment and won't be executed`

There are no multiline comments in Zig (e.g. like /* */ comments in C). This helps allow Zig to have the property that each line of code can be tokenized out of context.

## Doc comments
A doc comment is one that begins with exactly three slashes (i.e. /// but not ////); multiple doc comments in a row are merged together to form a multiline doc comment. The doc comment documents whatever immediately follows it.

## Top-Level Doc comments
User documentation that doesn't belong to whatever immediately follows it, like container-level documentation, goes in top-level doc comments. A top-level doc comment is one that begins with two slashes and an exclamation point: //!.