load("@rules_kotlin//kotlin:jvm.bzl", "kt_jvm_library")

kt_jvm_library(
    name = "widgets",
    srcs = glob([
        "**/*.kt",
    ]),
    visibility = ["//visibility:public"],
    deps = [
        "//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/assets",
        "//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/config",
        "//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/extensionPoints",
        "//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/impl",
        "//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/run",
        "//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/runnerAction",
        "//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/services",
        "//newplugin/plugin-bsp/workspacemodel/src:workspacemodel",
        "//intellij_platform_sdk:plugin_api",
    ],
)
