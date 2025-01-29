# This is a generated file, do not edit it
load("//aspects:rules/java/java_info.bzl", "extract_java_toolchain", "extract_java_runtime")
load("//aspects:rules/kt/kt_info.bzl", "extract_kotlin_info")
load("//aspects:rules/jvm/jvm_info.bzl", "extract_jvm_info")

EXTENSIONS = [
	extract_java_toolchain,
 	extract_java_runtime,
 	extract_kotlin_info,
 	extract_jvm_info
]
TOOLCHAINS = [
	"@bazel_tools//tools/jdk:runtime_toolchain_type",
 	"@rules_kotlin//kotlin/internal:kt_toolchain_type"
]
