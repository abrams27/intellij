load("@rules_kotlin//kotlin:jvm.bzl", "kt_jvm_library")

kt_jvm_library(
    name = "run",
    srcs = glob([
        "*.kt",
    ]),
    visibility = ["//visibility:public"],
    deps = [
        "//newplugin/plugin-bazel/src/main/kotlin/org/jetbrains/bazel/assets",
        "//newplugin/plugin-bazel/src/main/kotlin/org/jetbrains/bazel/config",
        "//intellij_platform_sdk:plugin_api",
    ],
)
