# Copyright 2019-2024 JetBrains s.r.o. and contributors. Use of this source code is governed by the Apache 2.0 license.

load("//aspects:extensions.bzl", "EXTENSIONS", "TOOLCHAINS")
load("//aspects:utils/utils.bzl", "ALL_DEPS", "COMPILE_DEPS", "PRIVATE_COMPILE_DEPS", "RUNTIME_DEPS", "abs", "collect_targets_from_attrs", "create_struct", "file_location", "get_aspect_ids", "update_sync_output_groups")
load("//aspects:rules/java/java_info.bzl", "java_info_in_target", "java_info_reference")

def create_all_extension_info(target, ctx, output_groups, dep_targets):
    all_info = [create_extension_info(target = target, ctx = ctx, output_groups = output_groups, dep_targets = dep_targets) for create_extension_info in EXTENSIONS]
    return [(info, exported_properties) for info, exported_properties in all_info if info != None]

COMPILE = 0
RUNTIME = 1

def make_dep(dep, dependency_type):
    return struct(
        id = str(dep.bsp_info.id),
        dependency_type = dependency_type,
    )

def make_deps(deps, dependency_type):
    return [make_dep(dep, dependency_type) for dep in deps]

def _is_proto_library_wrapper(target, ctx):
    if not ctx.rule.kind.endswith("proto_library") or ctx.rule.kind == "proto_library":
        return False

    deps = collect_targets_from_attrs(ctx.rule.attr, ["deps"])
    return len(deps) == 1 and deps[0].bsp_info and deps[0].bsp_info.kind == "proto_library"

def _get_forwarded_deps(target, ctx):
    if _is_proto_library_wrapper(target, ctx):
        return collect_targets_from_attrs(ctx.rule.attr, ["deps"])
    return []

def _is_analysis_test(target):
    """Returns if the target is an analysis test.

    Rules created with analysis_test=True cannot create write actions, so the
    aspect should skip them.
    """
    return AnalysisTestResultInfo in target

def files_to_list(source):
    if not hasattr(source, "files"):
        return []
    return source.files.to_list()

def _bsp_target_info_aspect_impl(target, ctx):
    if target.label.name.endswith(".semanticdb") or _is_analysis_test(target):
        return []

    rule_attrs = ctx.rule.attr

    direct_dep_targets = collect_targets_from_attrs(rule_attrs, COMPILE_DEPS)
    private_direct_dep_targets = collect_targets_from_attrs(rule_attrs, PRIVATE_COMPILE_DEPS)
    direct_deps = make_deps(direct_dep_targets, COMPILE)

    exported_deps_from_deps = []
    if True:
        for dep in direct_dep_targets:
            exported_deps_from_deps = exported_deps_from_deps + dep.bsp_info.export_deps

    compile_deps = direct_deps + exported_deps_from_deps

    runtime_dep_targets = collect_targets_from_attrs(rule_attrs, RUNTIME_DEPS)
    runtime_deps = make_deps(runtime_dep_targets, RUNTIME)

    all_deps = depset(compile_deps + runtime_deps).to_list()

    # Propagate my own exports
    export_deps = []
    direct_exports = []
    if java_info_in_target(target):
        direct_exports = collect_targets_from_attrs(rule_attrs, ["exports"])
        export_deps.extend(make_deps(direct_exports, COMPILE))
        for export in direct_exports:
            export_deps.extend(export.bsp_info.export_deps)
        export_deps = depset(export_deps).to_list()

    forwarded_deps = _get_forwarded_deps(target, ctx) + direct_exports

    dep_targets = direct_dep_targets + private_direct_dep_targets + runtime_dep_targets + direct_exports
    output_groups = dict()
    for dep in dep_targets:
        for k, v in dep.bsp_info.output_groups.items():
            output_groups[k] = output_groups[k] + [v] if k in output_groups else [v]

    for k, v in output_groups.items():
        output_groups[k] = depset(transitive = v)

    srcs_attr = getattr(ctx.rule.attr, "srcs", [])
    sources = []
    generated_sources = []

    if type(srcs_attr) == "list":
        all_sources = [
            file_location(f)
            for t in srcs_attr
            for f in files_to_list(t)
            if not f.is_directory
        ]

        sources = [
            s
            for s in all_sources
            if s.is_source
        ]

        generated_sources = [
            s
            for s in all_sources
            if not s.is_source
        ]

    resources_attr = getattr(ctx.rule.attr, "resources", [])
    resources = []

    if type(resources_attr) == "list":
        resources = [
            file_location(f)
            for t in resources_attr
            for f in files_to_list(t)
        ]

    aspect_ids = get_aspect_ids(ctx, target)

    default_info = target[DefaultInfo]
    executable = default_info and default_info.files_to_run.executable != None

    env = getattr(rule_attrs, "env", {})
    if type(env) == "Target":
        env = str(env.label)

    info = dict(
        id = str(target.label),
        kind = ctx.rule.kind,
        tags = rule_attrs.tags,
        dependencies = list(all_deps),
        sources = sources,
        generated_sources = generated_sources,
        resources = resources,
        env = env,
        env_inherit = getattr(rule_attrs, "env_inherit", []),
        executable = executable,
    )

    exported_properties = dict(
        id = target.label,
        kind = ctx.rule.kind,
        export_deps = export_deps,
        output_groups = output_groups,
    )

    all_extension_info = create_all_extension_info(target, ctx, output_groups, dep_targets)
    for (extension_info, extension_exported_properties) in all_extension_info:
        info.update(extension_info)
        if extension_exported_properties != None:
            exported_properties.update(extension_exported_properties)

    file_name = target.label.name
    file_name = file_name + "-" + str(abs(hash(file_name)))
    if aspect_ids:
        file_name = file_name + "-" + str(abs(hash(".".join(aspect_ids))))
    file_name = "bsp.%s.bsp-info.textproto" % file_name
    info_file = ctx.actions.declare_file(file_name)
    ctx.actions.write(info_file, proto.encode_text(create_struct(**info)))
    update_sync_output_groups(output_groups, "bsp-target-info", depset([info_file]))

    return struct(
        bsp_info = struct(**exported_properties),
        output_groups = output_groups,
    )

bsp_target_info_aspect = aspect(
    implementation = _bsp_target_info_aspect_impl,
    required_aspect_providers = [java_info_reference()],
    attr_aspects = ALL_DEPS,
    toolchains = TOOLCHAINS,
    fragments = ["cpp"]
)
