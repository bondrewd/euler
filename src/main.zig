const std = @import("std");
const problems = @import("problems.zig");

pub fn main() !void {
    const out = std.io.getStdOut().writer();
    try out.print("Problem 001: {d}\n", .{problems.p001()});
    try out.print("Problem 002: {d}\n", .{problems.p002()});
    try out.print("Problem 003: {d}\n", .{problems.p003()});
    try out.print("Problem 004: {d}\n", .{problems.p004()});
    try out.print("Problem 005: {d}\n", .{problems.p005()});
    try out.print("Problem 006: {d}\n", .{problems.p006()});
    try out.print("Problem 007: {d}\n", .{problems.p007()});
    try out.print("Problem 008: {d}\n", .{problems.p008()});
    try out.print("Problem 009: {d}\n", .{problems.p009()});
    try out.print("Problem 010: {d}\n", .{problems.p010()});
    try out.print("Problem 011: {d}\n", .{problems.p011()});
    try out.print("Problem 012: {d}\n", .{problems.p012()});
}
