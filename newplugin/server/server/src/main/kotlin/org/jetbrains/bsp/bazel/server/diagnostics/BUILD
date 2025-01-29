load("@rules_kotlin//kotlin:jvm.bzl", "kt_jvm_library")

kt_jvm_library(
    name = "diagnostics",
    srcs = glob(["*.kt"]),
    visibility = ["//newplugin/server/server:__subpackages__"],
    deps = [
        "//newplugin/server/bazelrunner",
        "//newplugin/server/commons",
        "//newplugin/server/server/src/main/kotlin/org/jetbrains/bsp/bazel/server/label",
        "@maven//:ch_epfl_scala_bsp4j",
    ],
)
