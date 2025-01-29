load("@rules_kotlin//kotlin:jvm.bzl", "kt_jvm_library")

kt_jvm_library(
    name = "params",
    srcs = glob(["*.kt"]),
    visibility = ["//newplugin/server/bazelrunner:__subpackages__"],
    deps = [
        "//newplugin/commons/src/main/kotlin/org/jetbrains/bazel/commons/constants",
    ],
)
