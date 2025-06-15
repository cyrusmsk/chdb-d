module bindings;

struct local_result
{
    char * buf;
    size_t len;
    void * _vec; // std::vector<char> *, for freeing
    double elapsed;
    ulong rows_read;
    ulong bytes_read;
}

struct local_result_v2
{
    char * buf;
    size_t len;
    void * _vec; // std::vector<char> *, for freeing
    double elapsed;
    ulong rows_read;
    ulong bytes_read;
    char * error_message;
}

/**
 * Connection structure for chDB
 * Contains server instance, connection state, and query processing queue
 */
struct chdb_conn
{
    void * server; /* ClickHouse LocalServer instance */
    bool connected; /* Connection state flag */
    void * queue; /* Query processing queue */
}

struct chdb_streaming_result
{
    void * internal_data;
}
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
chdb_connection * chdb_connect(int argc, char ** argv);

/**
 * Closes an existing chDB connection and cleans up resources.
 * Thread-safe function that handles connection shutdown and cleanup.
 *
 * @param conn Pointer to connection pointer to close
 */
 void chdb_close_conn(chdb_connection * conn);

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
chdb_result * chdb_query(chdb_connection conn, const char * query, const char * format);

/**
 * @brief Execute a query with command-line interface
 * @param argc Argument count (same as main()'s argc)
 * @param argv Argument vector (same as main()'s argv)
 * @return Query result structure containing output or error message
 */
chdb_result * chdb_query_cmdline(int argc, char ** argv);

/**
 * Executes a streaming query on the given connection.
 * @brief Initializes streaming query execution and returns result handle
 * @param conn Connection to execute query on
 * @param query SQL query string to execute
 * @param format Output format string (e.g. "CSV", default format)
 * @return Streaming result handle containing query state or error message
 * @note Returns error result if connection is invalid or closed
 */
chdb_result * chdb_stream_query(chdb_connection conn, const char * query, const char * format);

/**
 * Fetches next chunk of streaming results.
 * @brief Iterates through streaming query results
 * @param conn Active connection handle
 * @param result Streaming result handle from query_conn_streaming()
 * @return Materialized result chunk with data
 * @note Returns empty result when stream ends
 */
chdb_result * chdb_stream_fetch_result(chdb_connection conn, chdb_result * result);

/**
 * Cancels ongoing streaming query.
 * @brief Aborts streaming query execution and cleans up resources
 * @param conn Active connection handle
 * @param result Streaming result handle to cancel
 */
void chdb_stream_cancel_query(chdb_connection conn, chdb_result * result);

/**
 * Destroys a query result and releases all associated resources
 * @param result The result handle to destroy
 */
void chdb_destroy_query_result(chdb_result * result);

/**
 * Gets pointer to the result data buffer
 * @param result The query result handle
 * @return Read-only pointer to the result data
 */
char * chdb_result_buffer(chdb_result * result);

/**
 * Gets the length of the result data
 * @param result The query result handle
 * @return Size of result data in bytes
 */
size_t chdb_result_length(chdb_result * result);

/**
 * Gets query execution time
 * @param result The query result handle
 * @return Elapsed time in seconds
 */
double chdb_result_elapsed(chdb_result * result);

/**
 * Gets total rows in query result
 * @param result The query result handle
 * @return Number of rows contained in the result set
 */
ulong chdb_result_rows_read(chdb_result * result);

/**
 * Gets the total bytes occupied by the result set in internal binary format
 * @param result The query result handle
 * @return Number of bytes occupied by the result set in internal binary representation
 */
ulong chdb_result_bytes_read(chdb_result * result);

/**
 * Gets rows read from storage engine
 * @param result The query result handle
 * @return Number of rows read from storage
 */
ulong chdb_result_storage_rows_read(chdb_result * result);

/**
 * Gets bytes read from storage engine
 * @param result The query result handle
 * @return Number of bytes read from storage engine
 */
ulong chdb_result_storage_bytes_read(chdb_result * result);

/**
 * Retrieves error message from query execution
 * @param result The query result handle
 * @return Null-terminated error description, NULL if no error
 */
const(char) * chdb_result_error(chdb_result * result);
