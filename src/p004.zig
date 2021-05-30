const std = @import("std");
const math = std.math;
const testing = std.testing;

pub fn p004() u32 {
    return largest(3);
}

fn largest(d: u32) u32 {
    const limit = math.pow(u32, 10, d);
    var n: u32 = 0;
    var p: u32 = 0;
    var i: u32 = 0;
    var j: u32 = 0;
    while (i < limit) : (i += 1) {
        j = i;
        while (j < limit) : (j += 1) {
            p = i * j;
            if (p > n and isPalindromic(p)) {
                n = p;
            }
        }
    }

    return n;
}

fn numOfDigits(num: u32) u32 {
    var n: u32 = num;
    var d: u32 = 0;
    while (true) {
        n /= 10;
        d += 1;
        if (n == 0) break;
    }
    return d;
}

fn isPalindromic(num: u32) bool {
    const n: u32 = numOfDigits(num);
    const h: u32 = n / 2;
    var i: u32 = 0;
    while (i < h) : (i += 1) {
        const a = (num / math.pow(u32, 10, i)) % 10;
        const b = (num / math.pow(u32, 10, n - i - 1)) % 10;
        if (a != b) return false;
    }
    return true;
}

test "Problem 004.1" {
    try testing.expect(numOfDigits(0) == 1);
    try testing.expect(numOfDigits(1) == 1);
    try testing.expect(numOfDigits(12) == 2);
    try testing.expect(numOfDigits(123) == 3);
    try testing.expect(numOfDigits(1234) == 4);
    try testing.expect(numOfDigits(12345) == 5);
}

test "Problem 004.2" {
    try testing.expect(isPalindromic(0));
    try testing.expect(isPalindromic(1));
    try testing.expect(isPalindromic(11));
    try testing.expect(isPalindromic(121));
    try testing.expect(isPalindromic(1221));
    try testing.expect(isPalindromic(12321));
}

test "Problem 004.3" {
    std.debug.print("largest: {any}\n", .{largest(2)});
    try testing.expect(largest(2) == 9009);
}
