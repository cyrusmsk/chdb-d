module chdb.bindings;

import core.sys.posix.dlfcn;

extern(C) {
    // Opaque handle for query results.
    // Internal data structure managed by chDB implementation.
    // Users should only interact through API functions.
    struct chdb_result
    {
	    void * internal_data;
    }

    // connection handle wrapping database session state.
    // internal data structure managed by chdb implementation.
    // users should only interact through api functions.
    struct chdb_connection_
    {
	    void * internal_data;
    }
    alias chdb_connection = chdb_connection_*;

    /**
    * Creates a new chDB connection.
    * Only one active connection is allowed per process.
    * Creating a new connection with different path requires closing existing connection.
    *
    * @param argc Number of command-line arguments
    * @param argv Command-line arguments array (--path=<db_path> to specify database location)
    * @return Pointer to connection pointer, or NULL on failure
    * @note Default path is ":memory:" if not specified
    */
    chdb_connection * function(int argc, char ** argv) chdb_connect;

    /**
    * Closes an existing chDB connection and cleans up resources.
    * Thread-safe function that handles connection shutdown and cleanup.
    *
    * @param conn Pointer to connection pointer to close
    */
    void function(chdb_connection * conn) chdb_close_conn;

    /**
    * Executes a query on the given connection.
    * Thread-safe function that handles query execution in a separate thread.
    *
    * @param conn Connection to execute query on
    * @param query SQL query string to execute
    * @param format Output format string (e.g., "CSV", default format)
    * @return Query result structure containing output or error message
    * @note Returns error result if connection is invalid or closed
    */
    chdb_result * function(chdb_connection conn, const(char) * query, const (char) * format) chdb_query;

    /**
    * @brief Execute a query with command-line interface
    * @param argc Argument count (same as main()'s argc)
    * @param argv Argument vector (same as main()'s argv)
    * @return Query result structure containing output or error message
    */
    chdb_result * function(int argc, char ** argv) chdb_query_cmdline;

    /**
    * Executes a streaming query on the given connection.
    * @brief Initializes streaming query execution and returns result handle
    * @param conn Connection to execute query on
    * @param query SQL query string to execute
    * @param format Output format string (e.g. "CSV", default format)
    * @return Streaming result handle containing query state or error message
    * @note Returns error result if connection is invalid or closed
    */
    chdb_result * function(chdb_connection conn, const(char) * query, const(char) * format) chdb_stream_query;

    /**
    * Fetches next chunk of streaming results.
    * @brief Iterates through streaming query results
    * @param conn Active connection handle
    * @param result Streaming result handle from query_conn_streaming()
    * @return Materialized result chunk with data
    * @note Returns empty result when stream ends
    */
    chdb_result * function(chdb_connection conn, chdb_result * result) chdb_stream_fetch_result;

    /**
    * Cancels ongoing streaming query.
    * @brief Aborts streaming query execution and cleans up resources
    * @param conn Active connection handle
    * @param result Streaming result handle to cancel
    */
    void function(chdb_connection conn, chdb_result * result) chdb_stream_cancel_query;

    /**
    * Destroys a query result and releases all associated resources
    * @param result The result handle to destroy
    */
    void function(chdb_result * result) chdb_destroy_query_result;

    /**
    * Gets pointer to the result data buffer
    * @param result The query result handle
    * @return Read-only pointer to the result data
    */
    char * function(chdb_result * result) chdb_result_buffer;

    /**
    * Gets the length of the result data
    * @param result The query result handle
    * @return Size of result data in bytes
    */
    size_t function(chdb_result * result) chdb_result_length;

    /**
    * Gets query execution time
    * @param result The query result handle
    * @return Elapsed time in seconds
    */
    double function(chdb_result * result) chdb_result_elapsed;

    /**
    * Gets total rows in query result
    * @param result The query result handle
    * @return Number of rows contained in the result set
    */
    ulong function(chdb_result * result) chdb_result_rows_read;

    /**
    * Gets the total bytes occupied by the result set in internal binary format
    * @param result The query result handle
    * @return Number of bytes occupied by the result set in internal binary representation
    */
    ulong function(chdb_result * result) chdb_result_bytes_read;

    /**
    * Gets rows read from storage engine
    * @param result The query result handle
    * @return Number of rows read from storage
    */
    ulong function(chdb_result * result) chdb_result_storage_rows_read;

    /**
    * Gets bytes read from storage engine
    * @param result The query result handle
    * @return Number of bytes read from storage engine
    */
    ulong function(chdb_result * result) chdb_result_storage_bytes_read;

    /**
    * Retrieves error message from query execution
    * @param result The query result handle
    * @return Null-terminated error description, NULL if no error
    */
    const(char) * function(chdb_result * result) chdb_result_error;
}

void * handle;

void unload_bindings()
{
    dlclose(handle);
}

void load_bindings()
{
    handle = dlopen("/usr/local/lib/libchdb.so", RTLD_LAZY);
    if (!handle)
    {
        return;
    }

    chdb_connect = cast(typeof(chdb_connect))dlsym(handle, "chdb_connect".ptr);
    chdb_close_conn = cast(typeof(chdb_close_conn))dlsym(handle, "chdb_close_conn".ptr);
    chdb_query = cast(typeof(chdb_query))dlsym(handle, "chdb_query".ptr);
    chdb_result_buffer = cast(typeof(chdb_result_buffer))dlsym(handle, "chdb_result_buffer".ptr);
    chdb_result_length = cast(typeof(chdb_result_length))dlsym(handle, "chdb_result_length".ptr);
    chdb_result_elapsed = cast(typeof(chdb_result_elapsed))dlsym(handle, "chdb_result_elapsed".ptr);
    chdb_result_rows_read = cast(typeof(chdb_result_rows_read))dlsym(handle, "chdb_result_rows_read".ptr);
    chdb_result_bytes_read = cast(typeof(chdb_result_bytes_read))dlsym(handle, "chdb_result_bytes_read".ptr);
    chdb_result_error = cast(typeof(chdb_result_error))dlsym(handle, "chdb_result_error".ptr);
}
