load("@rules_kotlin//kotlin:jvm.bzl", "kt_jvm_library")

kt_jvm_library(
    name = "server",
    srcs = glob([
        "**/*.kt",
    ]),
    visibility = [
        #         "//newplugin/server/bspcli:__subpackages__",
        #         "//newplugin/server/install:__subpackages__",
        #         "//newplugin/server/server:__subpackages__",
        "//visibility:public",
    ],
    deps = [
        "//newplugin/server/bazelrunner",
        "//newplugin/server/commons",
        "//newplugin/server/executioncontext/workspacecontext",
        "//newplugin/server/logger",
        "//newplugin/server/server/src/main/kotlin/org/jetbrains/bsp/bazel/server/bep",
        "//newplugin/server/server/src/main/kotlin/org/jetbrains/bsp/bazel/server/bsp",
        "//newplugin/server/server/src/main/kotlin/org/jetbrains/bsp/bazel/server/bsp/info",
        "//newplugin/server/server/src/main/kotlin/org/jetbrains/bsp/bazel/server/bsp/managers",
        "//newplugin/server/server/src/main/kotlin/org/jetbrains/bsp/bazel/server/bsp/utils",
        "//newplugin/server/server/src/main/kotlin/org/jetbrains/bsp/bazel/server/bzlmod",
        "//newplugin/server/server/src/main/kotlin/org/jetbrains/bsp/bazel/server/diagnostics",
        "//newplugin/server/server/src/main/kotlin/org/jetbrains/bsp/bazel/server/sync",
        "//newplugin/server/server/src/main/kotlin/org/jetbrains/bsp/bazel/server/sync/firstPhase",
        "@maven//:ch_epfl_scala_bsp4j",
        "@maven//:org_apache_logging_log4j_log4j_api",
        "@maven//:org_apache_logging_log4j_log4j_core",
        "@maven//:org_eclipse_lsp4j_org_eclipse_lsp4j_jsonrpc",
    ],
)
