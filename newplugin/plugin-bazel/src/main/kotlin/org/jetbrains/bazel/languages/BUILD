load("@rules_kotlin//kotlin:jvm.bzl", "kt_jvm_library")

kt_jvm_library(
    name = "languages",
    srcs = glob([
        "**/*.kt",
        "**/*.java",
    ]),
    visibility = ["//newplugin/plugin-bazel:__subpackages__"],
    deps = [
        "//newplugin/commons/src/main/kotlin/org/jetbrains/bazel/commons/label",
        "//newplugin/plugin-bazel/src/main/kotlin/org/jetbrains/bazel/assets",
        "//newplugin/plugin-bazel/src/main/kotlin/org/jetbrains/bazel/languages/projectview/base",
        "//newplugin/plugin-bazel/src/main/kotlin/org/jetbrains/bazel/languages/projectview/highlighting:higlighting",
        "//newplugin/plugin-bazel/src/main/kotlin/org/jetbrains/bazel/languages/projectview/lexer",
        "//intellij_platform_sdk:plugin_api",
    ],
)
