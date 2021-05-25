const std = @import("std");

pub fn build(b: *std.build.Builder) void {
    const mode = b.standardReleaseOptions();
    const target = b.standardTargetOptions(.{});

    const exe = b.addExecutable("euler", "src/main.zig");
    exe.setOutputDir("bin");
    exe.setBuildMode(mode);
    exe.setTarget(target);
    exe.install();

    const run_cmd = exe.run();
    run_cmd.step.dependOn(b.getInstallStep());

    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);

    const test_cmd = b.addTest("src/tests.zig");
    test_cmd.setBuildMode(mode);
    test_cmd.setTarget(target);

    const test_step = b.step("test", "Run library tests");
    test_step.dependOn(&test_cmd.step);
}
