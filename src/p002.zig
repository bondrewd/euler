const std = @import("std");
const testing = std.testing;

pub fn problem() u32 {
    return sumOfFibNums(1_000_000);
}

fn sumOfFibNums(n: u32) u32 {
    var a: u32 = 0;
    var b: u32 = 1;
    var c: u32 = undefined;
    var acc: u32 = 0;
    var i: u32 = 0;
    while (i < n) : (i += 1) {
        c = b;
        b = a + b;
        if (b > 4_000_000) break;
        a = c;
        if (b % 2 == 0) acc += b;
    }
    return acc;
}

test "Problem 002" {
    const rslt = sumOfFibNums(10);
    try testing.expect(rslt == 44);
}
