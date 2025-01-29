load("@rules_kotlin//kotlin:jvm.bzl", "kt_jvm_library")

kt_jvm_library(
    name = "flow",
    srcs = glob([
        "**/*.kt",
    ]),
    visibility = ["//newplugin/plugin-bazel:__subpackages__"],
    deps = [
        "//newplugin/commons/src/main/kotlin/org/jetbrains/bazel/commons/constants",
        "//newplugin/commons/src/main/kotlin/org/jetbrains/bazel/commons/symlinks",
        "//newplugin/plugin-bazel/src/main/kotlin/org/jetbrains/bazel/coroutines",
        "//newplugin/plugin-bazel/src/main/kotlin/org/jetbrains/bazel/settings",
        "//newplugin/plugin-bazel/src/main/kotlin/org/jetbrains/bazel/ui",
        "//intellij_platform_sdk:plugin_api",
    ],
)
