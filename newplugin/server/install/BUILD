load("@rules_kotlin//kotlin:jvm.bzl", "kt_jvm_binary", "kt_jvm_library")

kt_jvm_library(
    name = "install-lib",
    visibility = ["//visibility:public"],
    exports = [
        "//newplugin/server/install/src/main/kotlin/org/jetbrains/bsp/bazel/install",
    ],
)
