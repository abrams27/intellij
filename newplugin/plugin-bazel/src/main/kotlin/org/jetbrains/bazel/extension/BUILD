load("@rules_kotlin//kotlin:jvm.bzl", "kt_jvm_library")

kt_jvm_library(
    name = "extension",
    srcs = glob([
        "*.kt",
    ]),
    visibility = ["//newplugin/plugin-bazel:__subpackages__"],
    deps = [
        "//newplugin/commons/src/main/kotlin/org/jetbrains/bazel/commons/label",
        "//newplugin/plugin-bazel/src/main/kotlin/org/jetbrains/bazel/debug",
        "//newplugin/plugin-bazel/src/main/kotlin/org/jetbrains/bazel/settings",
        "//newplugin/plugin-bazel/src/main/kotlin/org/jetbrains/bazel/ui",
        "@maven//:ch_epfl_scala_bsp4j",
        "//intellij_platform_sdk:plugin_api",
    ],
)
