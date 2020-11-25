# Autogenerated wrapper script for libhello_jll for powerpc64le-linux-gnu-cxx11
export libhello

using libcxxwrap_julia_jll
## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"
LIBPATH_default = ""

# Relative path to `libhello`
const libhello_splitpath = ["lib", "libhello.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libhello_path = ""

# libhello-specific global declaration
# This will be filled out by __init__()
libhello_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libhello = "libhello.so"


# Inform that the wrapper is available for this platform
wrapper_available = true

"""
Open all libraries
"""
function __init__()
    # This either calls `@artifact_str()`, or returns a constant string if we're overridden.
    global artifact_dir = find_artifact_dir()

    global PATH_list, LIBPATH_list
    # Initialize PATH and LIBPATH environment variable listings
    # From the list of our dependencies, generate a tuple of all the PATH and LIBPATH lists,
    # then append them to our own.
    foreach(p -> append!(PATH_list, p), (libcxxwrap_julia_jll.PATH_list,))
    foreach(p -> append!(LIBPATH_list, p), (libcxxwrap_julia_jll.LIBPATH_list,))

    global libhello_path = normpath(joinpath(artifact_dir, libhello_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libhello_handle = dlopen(libhello_path, RTLD_LAZY | RTLD_DEEPBIND)
    push!(LIBPATH_list, dirname(libhello_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(vcat(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)]), ':')

    
end  # __init__()
