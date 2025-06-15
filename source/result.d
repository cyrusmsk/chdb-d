module chdb.result;

import bindings;
import std.datetime;
import std.string : fromStringz;
import std.conv : to;

struct QueryResult
{
    private:
        chdb_result * _rawPtr;
        string _buf;
        size_t _len;
        Duration _elapsed;
        ulong _rows;
        ulong _bytes;
        string _error;

    public:
        this(chdb_result* rawPtr)
        {
            _rawPtr = rawPtr;
            _buf = chdb_result_buffer(rawPtr).fromStringz.to!string;
            _len = chdb_result_length(rawPtr);
            _elapsed = chdb_result_elapsed(rawPtr).to!long.dur!"seconds";
            _rows = chdb_result_rows_read(rawPtr);
            _bytes = chdb_result_bytes_read(rawPtr);
            _error = chdb_result_error(rawPtr).fromStringz.to!string;
        }
}
