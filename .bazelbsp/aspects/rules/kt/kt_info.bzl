load("@rules_kotlin//kotlin/internal:defs.bzl", "KtCompilerPluginInfo", "KtJvmInfo")
load("@rules_kotlin//kotlin/internal:opts.bzl", "KotlincOptions", "kotlinc_options_to_flags")
load("//aspects:utils/utils.bzl", "COMPILE_DEPS", "collect_targets_from_attrs", "convert_struct_to_dict", "create_struct", "file_location", "filter_not_none", "log_warn", "map")

KOTLIN_TOOLCHAIN_TYPE = "@rules_kotlin//kotlin/internal:kt_toolchain_type"

def get_kt_jvm_provider(target):
    if KtJvmInfo in target:
        return target[KtJvmInfo]
    return None

def extract_kotlin_info(target, ctx, dep_targets, **kwargs):
    provider = get_kt_jvm_provider(target)
    if provider == None:
        return None, None

    rule_attrs = ctx.rule.attr

    language_version = getattr(provider, "language_version", None)
    api_version = language_version
    associates = getattr(rule_attrs, "associates", [])
    associates_labels = [str(associate.label) for associate in associates]

    # Sometimes, associate targets only export the necessary dependencies for associating.
    # This workaround provides additional exports from the direct dependencies to be used as associates.
    #
    # This workaround still fails in the case where there are deeper transitive dependencies required to be associated.
    additional_associates = []
    direct_dep_targets = collect_targets_from_attrs(rule_attrs, COMPILE_DEPS)
    for dep in direct_dep_targets:
        if str(dep.label) in associates_labels:
            additional_associates = additional_associates + dep.bsp_info.export_deps
    additional_associates_labels = [associate.id for associate in additional_associates]

    kotlin_toolchain = ctx.toolchains[KOTLIN_TOOLCHAIN_TYPE]
    toolchain_kotlinc_opts = kotlin_toolchain.kotlinc_options
    kotlinc_opts_target = getattr(rule_attrs, "kotlinc_opts", None)
    kotlinc_opts = kotlinc_opts_target[KotlincOptions] if kotlinc_opts_target and KotlincOptions in kotlinc_opts_target else toolchain_kotlinc_opts
    kotlinc_opts_dict = convert_struct_to_dict(kotlinc_opts)

    # Inject default JVM target version if necessary

    # if not specifically set, the default value of "jvm_target" in kotlinc_opts is an empty string.
    if not kotlinc_opts_dict.get("jvm_target") and getattr(kotlin_toolchain, "jvm_target", ""):
        kotlinc_opts_dict["jvm_target"] = getattr(kotlin_toolchain, "jvm_target")

    stdlibs_files = kotlin_toolchain.jvm_stdlibs.compile_jars.to_list()
    stdlibs = map(file_location, stdlibs_files)

    # accumulate Kotlin compiler plugin info
    direct_plugins = getattr(rule_attrs, "plugins", [])
    dep_plugins = []

    # exported_compiler_plugins is not transitive, so we only iterate over direct dependencies.
    # See https://github.com/bazelbuild/rules_kotlin/blob/f14d01ef5af3ad7ff0660ff671ca9b20c8a020d2/kotlin/internal/jvm/jvm.bzl#L268
    for dep in dep_targets:
        if KtJvmInfo in dep:
            exported_compiler_plugins = getattr(dep[KtJvmInfo], "exported_compiler_plugins", None)
            if exported_compiler_plugins:
                dep_plugins.append(exported_compiler_plugins)
    plugins = depset(direct = direct_plugins, transitive = dep_plugins).to_list()
    kt_compiler_plugin_infos = filter_not_none([extract_kt_compiler_plugin_info(plugin) for plugin in plugins])

    kotlin_target_info = create_struct(
        language_version = language_version,
        api_version = api_version,
        associates = associates_labels + additional_associates_labels,
        kotlinc_opts = kotlinc_options_to_flags(create_struct(**kotlinc_opts_dict)),
        stdlibs = stdlibs,
        kotlinc_plugin_infos = kt_compiler_plugin_infos,
    )

    info_file = dict(kotlin_target_info = kotlin_target_info)

    return info_file, None

def extract_kt_compiler_plugin_info(plugin):
    if KtCompilerPluginInfo not in plugin:
        return None

    compiler_plugin_info = plugin[KtCompilerPluginInfo]

    plugin_jars = filter_not_none([file_location(it) for it in compiler_plugin_info.classpath.to_list()])

    raw_options = compiler_plugin_info.options
    kt_compiler_plugin_options = filter_not_none([extract_kt_compiler_plugin_option(raw_option) for raw_option in raw_options])

    return create_struct(
        plugin_jars = plugin_jars,
        kotlinc_plugin_options = kt_compiler_plugin_options,
    )

def extract_kt_compiler_plugin_option(option):
    if type(option) != "struct":
        log_warn("Kotlinc plugin option should be a struct")
        log_warn(option)
        return None

    plugin_id = getattr(option, "id", "")
    option_value = getattr(option, "value", "")

    if not plugin_id or not option_value:
        log_warn("Kotlinc plugin option should have plugin_id and option_value")
        log_warn(option)
        return None

    return create_struct(
        plugin_id = plugin_id,
        option_value = option_value,
    )
