load("@rules_kotlin//kotlin:jvm.bzl", "kt_jvm_library")

kt_jvm_library(
    name = "model",
    srcs = glob(["*.kt"]),
    visibility = ["//visibility:public"],
    deps = [
        "//newplugin/protocol",
        "//newplugin/server/bazelrunner/src/main/kotlin/org/jetbrains/bsp/bazel/bazelrunner/utils",
        "//newplugin/server/server/src/main/kotlin/org/jetbrains/bsp/bazel/server/bzlmod",
        "//newplugin/server/server/src/main/kotlin/org/jetbrains/bsp/bazel/server/label",
        "//newplugin/server/server/src/main/kotlin/org/jetbrains/bsp/bazel/server/sync/proto:bsp_target_info_java_proto",
        "//newplugin/server/server/src/main/kotlin/org/jetbrains/bsp/bazel/server/sync/proto:build_java_proto",
        "@maven//:ch_epfl_scala_bsp4j",
        "@maven//:com_fasterxml_jackson_core_jackson_annotations",
        "@maven//:com_fasterxml_jackson_core_jackson_databind",
    ],
)
