load("@rules_kotlin//kotlin:jvm.bzl", "kt_jvm_library")

kt_jvm_library(
    name = "projectDetails",
    srcs = glob([
        "**/*.kt",
    ]),
    visibility = ["//visibility:public"],
    deps = [
        "//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/config",
        "//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/extensionPoints",
        "//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/impl",
        "//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/magicmetamodel/impl/workspacemodel/impl",
        "//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/scala",
        "//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/ui/notifications",
        "//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/utils",
        "//newplugin/plugin-bsp/workspacemodel/src:workspacemodel",
        "//newplugin/protocol",
        "//intellij_platform_sdk:plugin_api",
    ],
)
