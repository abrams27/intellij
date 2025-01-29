load("@rules_kotlin//kotlin:jvm.bzl", "kt_jvm_library")

kt_jvm_library(
    name = "config",
    srcs = glob(["*.kt"]),
    visibility = ["//newplugin/plugin-bazel:__subpackages__"],
    deps = [
        "//intellij_platform_sdk:plugin_api",
    ],
)
