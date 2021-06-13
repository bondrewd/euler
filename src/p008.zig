const std = @import("std");
const testing = std.testing;

const data =
    \\73167176531330624919225119674426574742355349194934
    \\96983520312774506326239578318016984801869478851843
    \\85861560789112949495459501737958331952853208805511
    \\12540698747158523863050715693290963295227443043557
    \\66896648950445244523161731856403098711121722383113
    \\62229893423380308135336276614282806444486645238749
    \\30358907296290491560440772390713810515859307960866
    \\70172427121883998797908792274921901699720888093776
    \\65727333001053367881220235421809751254540594752243
    \\52584907711670556013604839586446706324415722155397
    \\53697817977846174064955149290862569321978468622482
    \\83972241375657056057490261407972968652414535100474
    \\82166370484403199890008895243450658541227588666881
    \\16427171479924442928230863465674813919123162824586
    \\17866458359124566529476545682848912883142607690042
    \\24219022671055626321111109370544217506941658960408
    \\07198403850962455444362981230987879927244284909188
    \\84580156166097919133875499200524063689912560717606
    \\05886116467109405077541002256983155200055935729725
    \\71636269561882670428252483600823257530420752963450
;

pub fn problem() u64 {
    return largestProduct(13) catch 0;
}

fn largestProduct(n: u64) !u64 {
    if (n > data.len) return error.NumberOfDigitsExceeded;
    var i: usize = 0;
    var p: u64 = 0;
    while (i <= data.len - n) : (i += 1) {
        var j: usize = i;
        var k: usize = 0;
        var t: u64 = 1;
        while (k < n) {
            const c = data[j];
            if (c != '\n') {
                t *= try asciiToNumber(data[j]);
                k += 1;
            }
            j += 1;
        }
        if (t > p) p = t;
    }
    return p;
}

fn asciiToNumber(c: u8) !u8 {
    if (c >= '0' and c <= '9') return c - 48;
    return error.InvalidAsciiChar;
}

test "Problem 008.1" {
    try testing.expect((try asciiToNumber('0')) == 0);
    try testing.expect((try asciiToNumber('1')) == 1);
    try testing.expect((try asciiToNumber('2')) == 2);
    try testing.expect((try asciiToNumber('3')) == 3);
    try testing.expect((try asciiToNumber('4')) == 4);
    try testing.expect((try asciiToNumber('5')) == 5);
    try testing.expect((try asciiToNumber('6')) == 6);
    try testing.expect((try asciiToNumber('7')) == 7);
    try testing.expect((try asciiToNumber('8')) == 8);
    try testing.expect((try asciiToNumber('9')) == 9);
}

test "Problem 008.2" {
    try testing.expect((try largestProduct(4)) == 5832);
}
