const std = @import("std");
const math = std.math;
const testing = std.testing;

pub fn problem() u64 {
    return smallest(20);
}

fn smallest(n: u64) u64 {
    if (n < 2) return 1;
    var i: u64 = 1;
    var s: u64 = 1;
    while (i <= n) : (i += 1) {
        s = lcm(i, s);
    }
    return s;
}

fn gcd(n1: u64, n2: u64) u64 {
    if (n1 == 0 or n2 == 0) return 0;
    var a = n1;
    var b = n2;
    while (b != 0) {
        const r = a % b;
        a = b;
        b = r;
    }
    return a;
}

fn lcm(n1: u64, n2: u64) u64 {
    if (n1 == 0 or n2 == 0) return 0;
    return n1 * n2 / gcd(n1, n2);
}

test "Problem 005.1" {
    try testing.expect(gcd(4, 2) == 2);
    try testing.expect(gcd(1, 1) == 1);
    try testing.expect(gcd(2, 1) == 1);
    try testing.expect(gcd(1, 2) == 1);
}

test "Problem 005.2" {
    try testing.expect(lcm(2, 3) == 6);
}

test "Problem 005.3" {
    try testing.expect(smallest(2) == 2);
    try testing.expect(smallest(3) == 6);
    try testing.expect(smallest(10) == 2520);
}
