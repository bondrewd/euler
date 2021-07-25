const std = @import("std");
const fmt = std.fmt;
const mem = std.mem;
const testing = std.testing;

pub fn problem() u32 {
    var i: u32 = 1;
    var n: u32 = 0;
    while (true) : (i += 1) {
        n = nthTriangleNumber(i);
        if (numOfDivisors(n) > 500) break;
    }

    return n;
}

fn nthTriangleNumber(n: u32) u32 {
    var rslt: u32 = 0;

    var i: u32 = 1;
    while (i <= n) : (i += 1) rslt += i;
    return rslt;
}

fn numOfDivisors(n: u32) u32 {
    var rslt: u32 = 1;

    var i: u32 = 2;
    var num: u32 = n;
    var count: u32 = 0;
    while (true) {
        if (num % i == 0) {
            count += 1;
            num /= i;
        } else {
            rslt *= count + 1;
            if (num == 1) {
                break;
            } else {
                count = 0;
                i += 1;
            }
        }
    }

    return rslt;
}

test "Problem 012.1" {
    try testing.expect(nthTriangleNumber(1) == 1);
    try testing.expect(nthTriangleNumber(2) == 3);
    try testing.expect(nthTriangleNumber(3) == 6);
    try testing.expect(nthTriangleNumber(4) == 10);
    try testing.expect(nthTriangleNumber(5) == 15);
}

test "Problem 012.2" {
    try testing.expect(numOfDivisors(1) == 1);
    try testing.expect(numOfDivisors(3) == 2);
    try testing.expect(numOfDivisors(6) == 4);
    try testing.expect(numOfDivisors(10) == 4);
    try testing.expect(numOfDivisors(28) == 6);
}
