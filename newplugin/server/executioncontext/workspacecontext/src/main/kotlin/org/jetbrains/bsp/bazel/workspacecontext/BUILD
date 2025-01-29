load("@rules_kotlin//kotlin:jvm.bzl", "kt_jvm_library")

kt_jvm_library(
    name = "workspacecontext",
    srcs = glob(["*.kt"]),
    visibility = [
        "//newplugin/server/executioncontext/workspacecontext:__pkg__",
        "//newplugin/server/executioncontext/workspacecontext/src/test/kotlin/org/jetbrains/bsp/bazel/workspacecontext:__pkg__",
        "//newplugin/server/server/src/main/kotlin/org/jetbrains/bsp/bazel/server/sync/sharding:__pkg__",
    ],
    exports = [
        "//newplugin/server/executioncontext/api",
    ],
    deps = [
        "//newplugin/commons/src/main/kotlin/org/jetbrains/bazel/commons/utils",
        "//newplugin/server/bazelrunner:params",
        "//newplugin/server/executioncontext/api",
        "//newplugin/server/executioncontext/projectview:generator",
        "//newplugin/server/executioncontext/projectview:parser",
        "//newplugin/server/server/src/main/kotlin/org/jetbrains/bsp/bazel/server/label",
        "@maven//:commons_io_commons_io",
        "@maven//:org_apache_logging_log4j_log4j_api",
        "@maven//:org_apache_logging_log4j_log4j_core",
    ],
)
