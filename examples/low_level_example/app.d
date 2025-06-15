import std.stdio : write, writeln;
import std.string : fromStringz, toStringz;
import std.algorithm : map;
import std.range : repeat, empty;
import std.array : join, array;
import std.typecons : Nullable;

import core.sys.posix.dlfcn;

struct local_result
{
    char * buf;
    size_t len;
    void * _vec;
    double elapsed;
    size_t rows_read;
    size_t bytes_read;
};

void exampleSimple()
{
    void * handle;
    extern(C) local_result* function(int, immutable(char)**) query_stable;
    extern(C) void* function(local_result*) free_result;

    handle = dlopen("/usr/local/lib/libchdb.so", RTLD_LAZY);
    if (!handle)
    {
        writeln("Failed to dlopen");
        return;
    }
    writeln("Loaded library successfully");

    query_stable = cast(typeof(query_stable))dlsym(handle, "query_stable".ptr);
    if (!query_stable)
    {
        writeln("Failed to load function query_stable");
        dlclose(handle);
        return;
    }
    writeln("Function query_stable successfully");

    free_result = cast(typeof(free_result))dlsym(handle, "free_result".ptr);
    if (!free_result)
    {
        writeln("Failed to load function free_result");
        dlclose(handle);
        return;
    }
    writeln("Function free_result loaded successfully");

    string queryStr = "SELECT 'Hello libchdb.so from D!'";
    auto arguments = ["clickhouse", "--multiquery", "--output-format=CSV", "--query="~queryStr].map!(e => e.toStringz).array;
    immutable(char)** arg_ptr = arguments.ptr;

    auto result = query_stable(cast(int) arguments.length, arg_ptr);
    if (result) {
        write("Query Result: ", result.buf.fromStringz());
        writeln("Elapsed Time: ", result.elapsed);
        writeln("Rows Read: ", result.rows_read);
        writeln("Bytes Read: ", result.bytes_read);

        free_result(result);
    }

    dlclose(handle);
}

void exampleDlopen()
{
    void * handle;
    extern(C) local_result* function(int, immutable(char)**) query_stable;
    extern(C) void* function(local_result*) free_result;

    handle = dlopen("/usr/local/lib/libchdb.so", RTLD_LAZY);
    if (!handle)
    {
        writeln("Failed to dlopen");
        return;
    }
    writeln("Loaded library successfully");

    query_stable = cast(typeof(query_stable))dlsym(handle, "query_stable".ptr);
    if (!query_stable)
    {
        writeln("Failed to load function query_stable");
        dlclose(handle);
        return;
    }
    writeln("Function query_stable successfully");

    free_result = cast(typeof(free_result))dlsym(handle, "free_result".ptr);
    if (!free_result)
    {
        writeln("Failed to load function free_result");
        dlclose(handle);
        return;
    }
    writeln("Function free_result loaded successfully");

    string outputFormat = "debug";
    string queryStr = "SELECT 'Hello libchdb.so from D!'";
    string path = "";
    string udfPath = "";

    auto arguments = ["clickhouse", "--multiquery", "--query="~queryStr];
    if (outputFormat == "Debug" || outputFormat == "debug") {
        arguments ~= "--verbose";
        arguments ~= "--log-level=trace";
        outputFormat = "CSV";
    }
    arguments ~= "--output-format="~outputFormat;

    if (!empty(path)) {
        arguments ~= "--path=" ~ path;
    }

    if (!empty(udfPath)) {
        arguments ~= "--user_scripts_path=" ~ udfPath;
        arguments ~= "--user_defined_executable_functions_config=" ~ udfPath ~ "/*.xml";
    }

    immutable(char)** arg_ptr = arguments.map!(e => e.toStringz).array.ptr;

    auto result = query_stable(cast(int) arguments.length, arg_ptr);
    if (result) {
        write("Query Result: ", result.buf.fromStringz());
        writeln("Elapsed Time: ", result.elapsed);
        writeln("Rows Read: ", result.rows_read);
        writeln("Bytes Read: ", result.bytes_read);

        free_result(result);
    }

    dlclose(handle);
}

void main(string[] args)
{
    if (args.length == 1) {
        writeln("Provide name of the example you want to run:");
        writeln(" ".repeat(5).join ~ " simple: for simple example");
        writeln(" ".repeat(5).join ~ " dlopen: for dlopen example");
    }
    else {
        switch(args[1]) {
            case "simple":
                exampleSimple();
                break;
            case "dlopen":
                exampleDlopen();
                break;
            default:
                writeln("This example is not implemented");
        }
    }
}
