const std = @import("std");
const math = std.math;
const testing = std.testing;

pub fn problem() u64 {
    return difference(100);
}

fn sumOfSquares(n: u64) u64 {
    var i: u64 = 1;
    var s: u64 = 0;
    while (i <= n) : (i += 1) {
        s += i * i;
    }
    return s;
}

fn squareOfSum(n: u64) u64 {
    var i: u64 = 1;
    var s: u64 = 0;
    while (i <= n) : (i += 1) {
        s += i;
    }
    return s * s;
}

fn difference(n: u64) u64 {
    return squareOfSum(n) - sumOfSquares(n);
}

test "Problem 006.1" {
    try testing.expect(sumOfSquares(10) == 385);
}

test "Problem 006.2" {
    try testing.expect(squareOfSum(10) == 3025);
}

test "Problem 006.3" {
    try testing.expect(difference(10) == 2640);
}
