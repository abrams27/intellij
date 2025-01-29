load("@rules_kotlin//kotlin:jvm.bzl", "kt_jvm_library")

kt_jvm_library(
    name = "utils",
    srcs = [
        "DelimitedMessageReader.kt",
        "InternalAspectsResolver.kt",
    ],
    visibility = ["//newplugin/server/server:__subpackages__"],
    deps = [
        "//newplugin/server/bazelrunner",
        "//newplugin/server/commons",
        "//newplugin/server/server/src/main/kotlin/org/jetbrains/bsp/bazel/server/bsp/info",
        "@maven//:io_grpc_grpc_protobuf",
        "@maven//:org_jetbrains_kotlinx_kotlinx_coroutines_core",
    ],
)

kt_jvm_library(
    name = "fileutils",
    srcs = ["FileUtils.kt"],
    visibility = [
        "//newplugin/server/install/src/main/kotlin/org/jetbrains/bsp/bazel/install:__subpackages__",
        "//newplugin/server/server:__subpackages__",
    ],
)
