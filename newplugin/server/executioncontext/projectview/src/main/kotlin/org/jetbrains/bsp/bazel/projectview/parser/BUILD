load("@rules_kotlin//kotlin:jvm.bzl", "kt_jvm_library")

kt_jvm_library(
    name = "parser",
    srcs = glob(["*.kt"]),
    resources = ["//newplugin/server/log4j_config"],
    visibility = [
        "//newplugin/server/executioncontext/projectview:__pkg__",
        "//newplugin/server/executioncontext/projectview/src/test/kotlin/org/jetbrains/bsp/bazel/projectview/parser:__pkg__",
    ],
    exports = [
        "//newplugin/server/executioncontext/projectview/src/main/kotlin/org/jetbrains/bsp/bazel/projectview/model",
    ],
    deps = [
        "//newplugin/server/commons",
        "//newplugin/server/executioncontext/projectview/src/main/kotlin/org/jetbrains/bsp/bazel/projectview/model",
        "//newplugin/server/executioncontext/projectview/src/main/kotlin/org/jetbrains/bsp/bazel/projectview/parser/sections",
        "@maven//:org_apache_logging_log4j_log4j_api",
        "@maven//:org_apache_logging_log4j_log4j_core",
    ],
)
