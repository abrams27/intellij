load("@rules_kotlin//kotlin:jvm.bzl", "kt_jvm_library")

kt_jvm_library(
    name = "generator",
    srcs = glob(["*.kt"]),
    visibility = [
        "//newplugin/server/executioncontext/projectview:__pkg__",
        "//newplugin/server/executioncontext/projectview/src/test/kotlin/org/jetbrains/bsp/bazel/projectview/generator:__pkg__",
    ],
    exports = [
        "//newplugin/server/executioncontext/projectview/src/main/kotlin/org/jetbrains/bsp/bazel/projectview/model",
    ],
    deps = [
        "//newplugin/server/executioncontext/projectview/src/main/kotlin/org/jetbrains/bsp/bazel/projectview/generator/sections",
        "//newplugin/server/executioncontext/projectview/src/main/kotlin/org/jetbrains/bsp/bazel/projectview/model",
    ],
)
