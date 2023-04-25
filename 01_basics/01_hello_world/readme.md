# Hello, World!

Build and run the program:</br>
`zig build run`

Run the tests:</br>
`zig test ./src/main.zig`


The Zig code sample in this directory demonstrates one way to create a program that will output: Hello, world! in different ways.

The code sample begins by adding the Zig Standard Library to the build using the @import builtin function. The @import("std") function call creates a structure that represents the Zig Standard Library. The code then declares a constant identifier, named std, that gives access to the features of the Zig Standard Library.

Next, a public function, pub fn, named main is declared. The main function is necessary because it tells the Zig compiler where the start of the program exists. Programs designed to be executed will need a pub fn main function.

A function is a block of any number of statements and expressions that, as a whole, perform a task. Functions may or may not return data after they are done performing their task. If a function cannot perform its task, it might return an error. Zig makes all of this explicit.

In the main.zig code sample, the main function is declared with the !void return type. This return type is known as an Error Union Type. This syntax tells the Zig compiler that the function will either return an error or nothing.

The void after the ! operator tells the compiler that the function will <strong>not</strong> return a value under normal circumstances (i.e. when no errors occur).

In Zig, a function's block of statements and expressions are surrounded by an open curly-brace { and close curly-brace }. Inside of the main function are expressions that perform the task of outputting Hello, world! to standard output.


