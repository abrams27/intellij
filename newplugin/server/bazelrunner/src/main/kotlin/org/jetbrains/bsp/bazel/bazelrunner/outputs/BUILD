load("@rules_kotlin//kotlin:jvm.bzl", "kt_jvm_library")

kt_jvm_library(
    name = "outputs",
    srcs = glob(["*.kt"]),
    visibility = ["//visibility:public"],
    deps = [
        "//newplugin/server/bazelrunner/src/main/kotlin/org/jetbrains/bsp/bazel/bazelrunner/utils",
        "//newplugin/server/commons",
        "//newplugin/server/logger",
        "@maven//:ch_epfl_scala_bsp4j",
    ],
)
