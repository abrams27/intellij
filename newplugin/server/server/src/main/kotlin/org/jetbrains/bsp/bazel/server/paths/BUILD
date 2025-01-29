load("@rules_kotlin//kotlin:jvm.bzl", "kt_jvm_library")

kt_jvm_library(
    name = "paths",
    srcs = glob(["*.kt"]),
    visibility = ["//newplugin/server/server:__subpackages__"],
    deps = [
        "//newplugin/server/bazelrunner",
        "//newplugin/server/server/src/main/kotlin/org/jetbrains/bsp/bazel/server/label",
        "//newplugin/server/server/src/main/kotlin/org/jetbrains/bsp/bazel/server/sync/proto:bsp_target_info_java_proto",
    ],
)
