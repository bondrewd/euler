const std = @import("std");
const testing = std.testing;

pub fn problem() u64 {
    return sumOfPrimes(2_000_000);
}

fn sumOfPrimes(n: u64) u64 {
    var i: u64 = 0;
    var s: u64 = 0;
    while (i < n) : (i += 1) {
        s += if (isPrime(i)) i else 0;
    }
    return s;
}

fn isPrime(n: u64) bool {
    if (n < 2) return false;
    var i: u64 = 2;
    while (i * i <= n) : (i += 1) {
        if (n % i == 0) return false;
    }
    return true;
}

test "Problem 010.1" {
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

test "Problem 010.2" {
    try testing.expect(sumOfPrimes(10) == 17);
}
