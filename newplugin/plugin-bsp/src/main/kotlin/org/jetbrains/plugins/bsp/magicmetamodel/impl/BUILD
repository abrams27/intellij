load("@rules_kotlin//kotlin:jvm.bzl", "kt_jvm_library")

kt_jvm_library(
    name = "impl",
    srcs = glob(["*.kt"]),
    associates = ["//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/magicmetamodel/impl/workspacemodel/impl/updaters/transformers"],
    visibility = ["//newplugin/plugin-bsp:__subpackages__"],
    deps = [
        "//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/magicmetamodel",
        "//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/magicmetamodel/impl/workspacemodel",
        "//newplugin/plugin-bsp/workspacemodel/src:workspacemodel",
        "@maven//:ch_epfl_scala_bsp4j",
        "//intellij_platform_sdk:plugin_api",
    ],
)
