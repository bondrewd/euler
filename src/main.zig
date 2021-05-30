const std = @import("std");
const problems = @import("problems.zig");

pub fn main() !void {
    const out = std.io.getStdOut().writer();
    try out.print("Problem 001: {d}\n", .{problems.p001()});
    try out.print("Problem 002: {d}\n", .{problems.p002()});
    try out.print("Problem 003: {d}\n", .{problems.p003()});
    try out.print("Problem 004: {d}\n", .{problems.p004()});
}
