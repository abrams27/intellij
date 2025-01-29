load("@rules_kotlin//kotlin:jvm.bzl", "kt_jvm_library")

kt_jvm_library(
    name = "debug",
    srcs = glob([
        "**/*.kt",
    ]),
    visibility = ["//newplugin/plugin-bazel:__subpackages__"],
    deps = [
        "//newplugin/plugin-bazel/src/main/kotlin/org/jetbrains/bazel/assets",
        "//newplugin/plugin-bazel/src/main/kotlin/org/jetbrains/bazel/config",
        "//newplugin/plugin-bazel/src/main/kotlin/org/jetbrains/bazel/languages",
        "//newplugin/plugin-bazel/src/main/proto",
        "//newplugin/protocol",
        "@maven//:ch_epfl_scala_bsp4j",
        "//intellij_platform_sdk:plugin_api",
    ],
)
