load("@rules_kotlin//kotlin:jvm.bzl", "kt_jvm_library")

kt_jvm_library(
    name = "api",
    srcs = glob(["*.kt"]),
    visibility = ["//newplugin/server/executioncontext/api:__pkg__"],
    exports = [
        "//newplugin/server/executioncontext/projectview:model",
    ],
    deps = [
        "//newplugin/server/executioncontext/projectview:model",
    ],
)
