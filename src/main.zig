// Thu nghiem dl gioi han trung tam
/// Kiem tra xem khi cac yeu to anh huong tang len thi
/// phan phoi se co dang chuan hay khong
const std = @import("std");
const math = std.math;

const print = std.debug.print;

pub const N: u32 = 1_000_000;
pub fn gen() []const i64 {
    var a: i16 = undefined;
    var b: i16 = undefined;
    var c: i16 = undefined;
    var d: i16 = undefined;
    var e: i16 = undefined;
    var f: i16 = undefined;
    var g: i16 = undefined;
    var h: i16 = undefined;

    var y: i64 = undefined;

    var sample: [N]i64 = undefined;
    var rndGen = std.rand.DefaultPrng.init(42);

    var i: u32 = 0;
    while (i < N) : (i += 1) {
        a = rndGen.random().int(i16);
        b = rndGen.random().int(i16);
        c = rndGen.random().int(i16);
        d = rndGen.random().int(i16);
        e = rndGen.random().int(i16);
        f = rndGen.random().int(i16);
        g = rndGen.random().int(i16);
        h = rndGen.random().int(i16);

        // Expression y

        y = @intCast(i64, a) + 2 * b - 6 * c + 155 + d + 3 * e - f + (g - h) * 7;
        // y = @as(i64, a) + 2 * @as(i64, b) - 6 * @as(i64, c) + 155 + @as(i64, d) + 3 * @as(i64, e) - @as(i64, f);
        // y = @as(i64, a) + 2 * @as(i64, b) - 12 * @as(i64, c) + 155;
        // y = @as(i64, a) + 2 * b;

        sample[i] = y;
        // print("a = {}, b = {}, c = {}, d = {}, y = {}\n", .{ a, b, c, d, y });
    }
    return &sample;
}

test "test" {
    const sample = gen();
    var i: usize = 0;
    while (i < N) : (i += 1) {
        print("{}\n", .{sample[i]});
    }
}

test "temp" {
    var a: i16 = 100;
    print("result: {}\n", .{@as(i64, a * 100)});
}

test "cast" {
    var a: i8 = 25;
    print("result: {}\n", .{@as(i16, a)});
}
