load("@rules_kotlin//kotlin:jvm.bzl", "kt_jvm_library")

kt_jvm_library(
    name = "runnerAction",
    srcs = glob([
        "**/*.kt",
    ]),
    visibility = ["//visibility:public"],
    deps = [
        "//newplugin/plugin-bsp/protocol/src/main/kotlin/org/jetbrains/bsp/protocol/utils",
        "//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/config",
        "//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/coroutines",
        "//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/impl",
        "//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/magicmetamodel/impl/workspacemodel/util",
        "//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/run",
    ],
)
