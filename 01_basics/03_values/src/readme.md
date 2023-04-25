# Values

Build and run the program:</br>
`zig build run`

## Primitive Types

| Type        | C Equivalent | Description |
| ----------- | ----------- | ----------- |
| i8	| int8_t	| signed 8-bit integer|
| u8	| uint8_t	| unsigned 8-bit integer|
| i16	| int16_t	| signed 16-bit integer|
| u16	| uint16_t	| unsigned 16-bit integer|
| i32	| int32_t	| signed 32-bit integer|
| u32	| uint32_t	| unsigned 32-bit integer|
| i64	| int64_t	| signed 64-bit integer|
| u64	| uint64_t	| unsigned 64-bit integer|
| i128	| __int128	| signed 128-bit integer|
| u128	| unsigned | __int128	unsigned 128-bit integer|
| isize	| intptr_t	| signed pointer sized integer|
| usize	| uintptr_t, | size_t	unsigned pointer sized integer. Also see #5185|
| c_short	| short	| for ABI compatibility with C|
| c_ushort	| unsigned short	| for ABI compatibility with C|
| c_int	| int	| for ABI compatibility with C|
| c_uint	| unsigned int	| for ABI compatibility with C|
| c_long	| long	| for ABI compatibility with C|
| c_ulong	| unsigned long	| for ABI compatibility with C|
| c_longlong	| long long	| for ABI compatibility with C|
| c_ulonglong	| unsigned long long	| for ABI compatibility with C|
| c_longdouble	| long double	| for ABI compatibility with C|
| f16	| _Float16	| 16-bit floating point (10-bit mantissa) IEEE-754-2008 binary16|
| f32	| float	| 32-bit floating point (23-bit mantissa) IEEE-754-2008 binary32|
| f64	| double	| 64-bit floating point (52-bit mantissa) IEEE-754-2008 binary64|
| f80	| double	| 80-bit floating point (64-bit mantissa) IEEE-754-2008 80-bit extended precision|
| f128	| _Float128	| 128-bit floating point (112-bit mantissa) IEEE-754-2008 binary128|
| bool	| bool	| true or false|
| anyopaque	| void	| Used for type-erased pointers.|
| void	| (none)	| Always the value void{}|
| noreturn	| (none)	| the type of break, continue, return, unreachable, and while (true) {}|
| type	| (none)	| the type of types|
| anyerror	| (none)	| an error code|
| comptime_int	| (none)	| Only allowed for comptime-known values. The type of integer literals.|
| comptime_float	| (none)	| Only allowed for comptime-known values. The type of float literals.|

In addition to the integer types above, arbitrary bit-width integers can be referenced by using an identifier of i or u followed by digits. For example, the identifier i7 refers to a signed 7-bit integer. The maximum allowed bit-width of an integer type is 65535.

## Primitive Values

| Name        | Description |
| ----------- | ----------- |
| true and false	| bool values	|
| null	| used to set an optional type to `null`	|
| undefined	| used to leave a value unspecified	|


## String Literals and Unicode Code Point Literals

String literals are constant single-item Pointers to null-terminated byte arrays. The type of string literals encodes both the length, and the fact that they are null-terminated, and thus they can be coerced to both Slices and Null-Terminated Pointers. Dereferencing string literals converts them to Arrays.

The encoding of a string in Zig is de-facto assumed to be UTF-8. Because Zig source code is UTF-8 encoded, any non-ASCII bytes appearing within a string literal in source code carry their UTF-8 meaning into the content of the string in the Zig program; the bytes are not modified by the compiler. However, it is possible to embed non-UTF-8 bytes into a string literal using \xNN notation.

Indexing into a string containing non-ASCII bytes will return individual bytes, whether valid UTF-8 or not. The Zig Standard Library provides routines for checking the validity of UTF-8 encoded strings, accessing their code points and other encoding/decoding related tasks in std.unicode.

Unicode code point literals have type comptime_int, the same as Integer Literals. All Escape Sequences are valid in both string literals and Unicode code point literals.

In many other programming languages, a Unicode code point literal is called a "character literal". However, there is no precise technical definition of a "character" in recent versions of the Unicode specification (as of Unicode 13.0). In Zig, a Unicode code point literal corresponds to the Unicode definition of a code point.

## Escape Sequences

| Escape Sequence        | Name |
| ----------- | ----------- |
|`\n`	| Newline |
|`\r`	| Carriage Return |
|`\t`	| Tab |
|`\\`	| Backslash |
|`\'`	| Single Quote |
|`\"`	| Double Quote |
|`\xNN`	| hexadecimal 8-bit byte value (2 digits) |
|`\u{NNNNNN}`	| hexadecimal Unicode code point UTF-8 encoded (1 or more digits) |

## Multiline String Literals

Multiline string literals have no escapes and can span across multiple lines. To start a multiline string literal, use the \\ token. Just like a comment, the string literal goes until the end of the line. The end of the line is not included in the string literal. However, if the next line begins with `\\` then a newline is appended and the string literal continues.

```
const hello_world_in_c =
    \\#include <stdio.h>
    \\
    \\int main(int argc, char **argv) {
    \\    printf("hello world\n");
    \\    return 0;
    \\}
;
```