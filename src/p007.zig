const std = @import("std");
const math = std.math;
const testing = std.testing;

pub fn problem() u64 {
    return nthPrime(10001);
}

fn nthPrime(n: u64) u64 {
    var i: u64 = 1;
    var p: u64 = 0;
    while (i <= n) : (i += 1) {
        var j: u64 = p + 1;
        while (!isPrime(j)) : (j += 1) {}
        p = j;
    }
    return p;
}

fn isPrime(n: u64) bool {
    if (n < 2) return false;
    var i: u64 = 2;
    while (i * i <= n) : (i += 1) {
        if (n % i == 0) return false;
    }
    return true;
}

test "Problem 007.1" {
    try testing.expect(!isPrime(1));
    try testing.expect(isPrime(2));
    try testing.expect(isPrime(3));
    try testing.expect(!isPrime(4));
    try testing.expect(isPrime(5));
    try testing.expect(!isPrime(6));
    try testing.expect(isPrime(7));
    try testing.expect(!isPrime(8));
    try testing.expect(!isPrime(9));
    try testing.expect(!isPrime(10));
}

test "Problem 007.2" {
    try testing.expect(nthPrime(1) == 2);
    try testing.expect(nthPrime(2) == 3);
    try testing.expect(nthPrime(3) == 5);
    try testing.expect(nthPrime(4) == 7);
    try testing.expect(nthPrime(5) == 11);
    try testing.expect(nthPrime(6) == 13);
}
