const std = @import("std");
const testing = std.testing;

pub fn problem() u64 {
    const t = tripletSum(1000);
    return t.a * t.b * t.c;
}

const Triplet = struct {
    a: u64,
    b: u64,
    c: u64,
};

fn tripletSum(n: u64) Triplet {
    var i: u64 = 1;
    while (i <= n - 2) : (i += 1) {
        var j: u64 = i + 1;
        while (j <= n - i - 1) : (j += 1) {
            if (isTriplet(i, j, n - i - j)) return Triplet{
                .a = i,
                .b = j,
                .c = n - i - j,
            };
        }
    }
    return Triplet{ .a = 0, .b = 0, .c = 0 };
}

fn isTriplet(a: u64, b: u64, c: u64) bool {
    return a * a + b * b == c * c;
}

test "Problem 009.1" {
    try testing.expect(isTriplet(3, 4, 5));
}

test "Problem 009.2" {
    try testing.expectEqual(tripletSum(12), Triplet{ .a = 3, .b = 4, .c = 5 });
}
