const std = @import("std");
const testing = std.testing;

pub fn problem() u32 {
    return sumOfMultiples(3, 5, 1000);
}

fn sumOfMultiples(a: u32, b: u32, n: u32) u32 {
    var acc: u32 = 0;
    var i: u32 = 0;
    while (i < n) : (i += 1) {
        if ((i % a == 0) or (i % b == 0)) acc += i;
    }
    return acc;
}

test "Problem 001" {
    const rslt = sumOfMultiples(3, 5, 10);
    try testing.expect(rslt == 23);
}
