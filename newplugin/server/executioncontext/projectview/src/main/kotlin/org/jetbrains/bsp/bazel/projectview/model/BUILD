load("@rules_kotlin//kotlin:jvm.bzl", "kt_jvm_library")

kt_jvm_library(
    name = "model",
    srcs = glob(["*.kt"]),
    visibility = [
        "//newplugin/server/executioncontext/projectview:__pkg__",
        "//newplugin/server/executioncontext/projectview/src/main/kotlin/org/jetbrains/bsp/bazel/projectview:__subpackages__",
        "//newplugin/server/executioncontext/projectview/src/test/kotlin/org/jetbrains/bsp/bazel/projectview/model:__pkg__",
    ],
    exports = [
        "//newplugin/server/executioncontext/projectview/src/main/kotlin/org/jetbrains/bsp/bazel/projectview/model/sections",
    ],
    deps = [
        "//newplugin/server/commons",
        "//newplugin/server/executioncontext/projectview/src/main/kotlin/org/jetbrains/bsp/bazel/projectview/model/sections",
        "@maven//:org_apache_logging_log4j_log4j_api",
        "@maven//:org_apache_logging_log4j_log4j_core",
    ],
)
