
load("//aspects:utils/utils.bzl", "create_struct", "file_location", "to_file_location")

def py_info_in_target(target):
    return False

def py_runtime_info_in_target(target):
    return False

def get_py_info(target):
    return None

def get_py_runtime_info(target):
    return None

def interpreter_from_absolute_path(path):
    if path == None:
        return None

    return to_file_location(path, "", False, True)

def interpreter_from_file(file):
    if file == None:
        return None

    return file_location(file)

def extract_python_info(target, ctx, **kwargs):
    if not py_info_in_target(target):
        return None, None

    if py_runtime_info_in_target(target):
        provider = get_py_runtime_info(target)
    else:
        provider = None

    interpreter = interpreter_from_file(getattr(provider, "interpreter", None))
    interpreter_path = interpreter_from_absolute_path(getattr(provider, "interpreter_path", None))

    final_interpreter = interpreter if interpreter != None else interpreter_path

    python_target_info = create_struct(
        interpreter = final_interpreter,
        version = getattr(provider, "python_version", None),
    )

    return dict(python_target_info = python_target_info), None
