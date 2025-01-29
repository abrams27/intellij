load("@rules_kotlin//kotlin:jvm.bzl", "kt_jvm_library")

kt_jvm_library(
    name = "ui",
    srcs = glob([
        "**/*.kt",
    ]),
    visibility = ["//newplugin/plugin-bazel:__subpackages__"],
    deps = [
        "//newplugin/plugin-bazel/src/main/kotlin/org/jetbrains/bazel/config",
        "//newplugin/plugin-bazel/src/main/kotlin/org/jetbrains/bazel/languages",
        "//intellij_platform_sdk:plugin_api",
    ],
)
