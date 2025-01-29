load("@rules_kotlin//kotlin:jvm.bzl", "kt_jvm_library")

exports_files(glob(["main/xml/*.xml"]))

kt_jvm_library(
    name = "intellij-bsp",
    visibility = ["//visibility:public"],
    exports = [
        "//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/assets",
        "//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/config",
        "//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/console",
        "//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/extensionPoints",
        "//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/impl",
        "//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/intellij",
        "//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/jvm",
        "//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/kotlin",
        "//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/performance",
        "//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/performanceImpl",
        "//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/projectDetails",
        "//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/run",
        "//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/runnerAction",
        "//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/scala",
        "//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/services",
        "//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/startup",
        "//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/ui/gutters",
        "//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/ui/notifications",
        "//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/ui/projectTree",
        "//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/ui/projectTree/action",
        "//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/ui/widgets",
        "//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/ui/widgets/fileTargets",
        "//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/utils",
        "//newplugin/plugin-bsp/src/main/kotlin/org/jetbrains/plugins/bsp/workspace",
    ],
)
