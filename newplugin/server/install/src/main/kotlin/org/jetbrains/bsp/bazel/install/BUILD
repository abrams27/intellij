load("@rules_kotlin//kotlin:jvm.bzl", "kt_jvm_library")

kt_jvm_library(
    name = "install",
    srcs = glob(["*.kt"]),
    resource_strip_prefix = "server",
    resources = ["//newplugin/server/aspects"],
    visibility = [
        "//newplugin/server/bspcli:__subpackages__",
        "//newplugin/server/e2e:__subpackages__",
        "//newplugin/server/install:__subpackages__",
    ],
    deps = [
        "//newplugin/commons/src/main/kotlin/org/jetbrains/bazel/commons/constants",
        "//newplugin/server/executioncontext/installationcontext",
        "//newplugin/server/executioncontext/projectview:generator",
        "//newplugin/server/executioncontext/projectview:parser",
        "//newplugin/server/install/src/main/kotlin/org/jetbrains/bsp/bazel/install/cli",
        "//newplugin/server/server/src/main/kotlin/org/jetbrains/bsp/bazel/server/bsp/utils:fileutils",
        "@maven//:ch_epfl_scala_bsp4j",
        "@maven//:com_google_code_gson_gson",
        "@maven//:commons_cli_commons_cli",
    ],
)
