load("@rules_kotlin//kotlin:jvm.bzl", "kt_jvm_library")

kt_jvm_library(
    name = "config",
    srcs = glob(["*.kt"]),
    visibility = ["//newplugin/plugin-bsp:__subpackages__"],
    deps = [
        "//newplugin/plugin-bsp/workspacemodel/src:workspacemodel",
        "//newplugin/protocol",
        "//intellij_platform_sdk:plugin_api",
    ],
)
