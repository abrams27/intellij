load("@rules_kotlin//kotlin:jvm.bzl", "kt_jvm_library")

kt_jvm_library(
    name = "startup",
    srcs = glob(["*.kt"]),
    visibility = ["//newplugin/plugin-bsp:__subpackages__"],
    deps = [
        "//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/config",
        "//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/extensionPoints",
        "//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/ui/notifications",
        "//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/ui/widgets",
        "//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/ui/widgets/fileTargets",
        "//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/utils",
    ],
)
