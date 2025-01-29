load("@rules_kotlin//kotlin:jvm.bzl", "kt_jvm_library")

kt_jvm_library(
    name = "gutters",
    srcs = glob(["*.kt"]),
    visibility = ["//newplugin/plugin-bsp:__subpackages__"],
    deps = [
        "//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/config",
        "//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/impl",
        "//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/ui/widgets",
        "//newplugin/plugin-bsp/workspacemodel/src:workspacemodel",
        "//intellij_platform_sdk:plugin_api",
    ],
)
