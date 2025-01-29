load("@rules_kotlin//kotlin:jvm.bzl", "kt_jvm_library")

kt_jvm_library(
    name = "firstPhase",
    srcs = glob(["*.kt"]),
    visibility = ["//visibility:public"],
    deps = [
        "//newplugin/protocol",
        "//newplugin/server/bazelrunner",
        "//newplugin/server/server/src/main/kotlin/org/jetbrains/bsp/bazel/server/bsp/managers",
        "//newplugin/server/server/src/main/kotlin/org/jetbrains/bsp/bazel/server/bsp/utils",
        "//newplugin/server/server/src/main/kotlin/org/jetbrains/bsp/bazel/server/label",
        "//newplugin/server/server/src/main/kotlin/org/jetbrains/bsp/bazel/server/sync/languages",
        "//newplugin/server/server/src/main/kotlin/org/jetbrains/bsp/bazel/server/sync/proto:build_java_proto",
        "@maven//:ch_epfl_scala_bsp4j",
        "@maven//:com_google_protobuf_protobuf_java",
        "@maven//:org_eclipse_lsp4j_org_eclipse_lsp4j_jsonrpc",
        "@maven//:org_jetbrains_kotlinx_kotlinx_coroutines_core",
    ],
)
