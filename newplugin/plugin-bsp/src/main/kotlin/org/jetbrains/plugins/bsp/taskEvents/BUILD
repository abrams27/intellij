load("@rules_kotlin//kotlin:jvm.bzl", "kt_jvm_library")

kt_jvm_library(
    name = "taskEvents",
    srcs = glob([
        "**/*.kt",
    ]),
    visibility = ["//visibility:public"],
    deps = [
        "//newplugin/protocol",
        "//intellij_platform_sdk:plugin_api",
    ],
)
