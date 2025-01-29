load("@rules_kotlin//kotlin:jvm.bzl", "kt_jvm_library")

# This is a workaround; for some reason bazel fails with
#  in deps attribute of kt_jvm_library rule //newplugin/server/src/main/kotlin/org/jetbrains/bsp/bazel/server/bep:bep:
#    '@googleapis//:google_devtools_build_v1_publish_build_event_proto' does not have mandatory providers: 'JavaInfo'
# if these libraries are depended on directly from a kt_jvm_library.

kt_jvm_library(
    name = "bep",
    srcs = glob([
        "*.java",
        "*.kt",
    ]),
    resources = ["//newplugin/server/log4j_config"],
    visibility = ["//newplugin/server/server:__subpackages__"],
    deps = [
        "//newplugin/protocol",
        "//newplugin/server/bazelrunner",
        "//newplugin/server/commons",
        "//newplugin/server/logger",
        "//newplugin/server/server/src/main/kotlin/org/jetbrains/bsp/bazel/server/diagnostics",
        "//newplugin/server/server/src/main/kotlin/org/jetbrains/bsp/bazel/server/label",
        "//newplugin/server/server/src/main/kotlin/org/jetbrains/bsp/bazel/server/paths",
        "@bazel_bep//jar",
        "@maven//:ch_epfl_scala_bsp4j",
        "@maven//:com_fasterxml_jackson_core_jackson_annotations",
        "@maven//:com_fasterxml_jackson_core_jackson_databind",
        "@maven//:com_fasterxml_jackson_dataformat_jackson_dataformat_xml",
        "@maven//:com_fasterxml_jackson_module_jackson_module_kotlin",
        "@maven//:com_google_guava_guava",
        "@maven//:com_google_protobuf_protobuf_java",
        "@maven//:io_grpc_grpc_stub",
        "@maven//:org_apache_logging_log4j_log4j_api",
        "@maven//:org_apache_logging_log4j_log4j_core",
    ],
)
