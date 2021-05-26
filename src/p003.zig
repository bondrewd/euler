const std = @import("std");
const testing = std.testing;

pub fn p003() u64 {
    return largestPrimeFactor(600_851_475_143);
}

fn largestPrimeFactor(num: u64) u64 {
    if (num < 2) return 1;
    var n: u64 = num;
    var f: u64 = 2;
    while (n != 1) : (f += 1) {
        while (n % f == 0) n /= f;
    }
    return f - 1;
}

test "Problem 003" {
    const rslt = largestPrimeFactor(13_195);
    try testing.expect(rslt == 29);
}
