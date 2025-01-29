load("@rules_kotlin//kotlin:jvm.bzl", "kt_jvm_library")

kt_jvm_library(
    name = "impl",
    srcs = glob([
        "**/*.java",
        "**/*.kt",
    ]),
    associates = ["//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/magicmetamodel/impl/workspacemodel/impl/updaters/transformers"],
    visibility = ["//visibility:public"],
    deps = [
        "//newplugin/plugin-bsp/jps-compilation/src:jps-compilation",
        "//newplugin/plugin-bsp/protocol/src/main/kotlin/org/jetbrains/bsp/protocol/utils",
        "//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/action",
        "//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/assets",
        "//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/config",
        "//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/coroutines",
        "//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/magicmetamodel",
        "//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/magicmetamodel/impl",
        "//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/performance",
        "//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/taskEvents",
        "//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/utils",
        "//newplugin/plugin-bsp/workspacemodel/src:workspacemodel",
        "//newplugin/protocol",
        "@maven//:ch_epfl_scala_bsp4j",
        "@maven//:com_google_code_gson_gson",
        "//intellij_platform_sdk:plugin_api",
    ],
)
