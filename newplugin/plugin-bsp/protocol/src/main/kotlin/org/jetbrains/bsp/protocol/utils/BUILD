load("@rules_kotlin//kotlin:jvm.bzl", "kt_jvm_library")

kt_jvm_library(
    name = "utils",
    srcs = glob([
        "*.kt",
    ]),
    visibility = ["//visibility:public"],
    deps = [
        "//newplugin/protocol",
        "@maven//:ch_epfl_scala_bsp4j",
        "//intellij_platform_sdk:plugin_api",
    ],
)
