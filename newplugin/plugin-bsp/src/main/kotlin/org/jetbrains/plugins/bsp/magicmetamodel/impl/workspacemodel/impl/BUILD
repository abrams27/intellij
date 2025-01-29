load("@rules_kotlin//kotlin:jvm.bzl", "kt_jvm_library")

kt_jvm_library(
    name = "impl",
    srcs = glob(["*.kt"]),
    associates = ["//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/magicmetamodel/impl/workspacemodel/impl/updaters"],
    visibility = ["//visibility:public"],
    deps = [
        "//newplugin/plugin-bsp/workspacemodel/src:workspacemodel",
        "//newplugin/protocol",
        "//intellij_platform_sdk:plugin_api",
    ],
)
