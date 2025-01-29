load("@rules_kotlin//kotlin:jvm.bzl", "kt_jvm_library")

kt_jvm_library(
    name = "jvm",
    srcs = glob([
        "**/*.kt",
    ]),
    visibility = ["//visibility:public"],
    deps = [
        "//newplugin/plugin-bsp/protocol/src/main/kotlin/org/jetbrains/bsp/protocol/utils",
        "//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/run",
        "//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/runnerAction",
        "//newplugin/plugin-bsp/workspacemodel/src:workspacemodel",
        "//newplugin/protocol",
        "//intellij_platform_sdk:plugin_api",
    ],
)
