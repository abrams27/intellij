load("@rules_kotlin//kotlin:jvm.bzl", "kt_jvm_library")

kt_jvm_library(
    name = "installationcontext",
    srcs = glob(["*.kt"]),
    visibility = [
        "//newplugin/server/executioncontext/installationcontext:__pkg__",
        "//newplugin/server/executioncontext/installationcontext/src/test/kotlin/org/jetbrains/bsp/bazel/installationcontext:__pkg__",
    ],
    exports = [
        "//newplugin/server/executioncontext/api",
    ],
    deps = [
        "//newplugin/server/executioncontext/api",
        "//newplugin/server/executioncontext/projectview:parser",
    ],
)
