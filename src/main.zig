const std = @import("std");
const problems = @import("problems.zig");

pub fn main() !void {
    const out = std.io.getStdOut().writer();
    try out.print("Problem 001: {d}\n", .{problems.p001()});
}
