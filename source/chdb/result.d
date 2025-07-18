module chdb.result;

private import chdb.bindings;
import std.datetime;
import std.string : fromStringz;
import std.conv : to;
debug{import std.stdio;}

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
            updateState();
        }

        ~this()
        {
            chdb_destroy_query_result(_rawPtr);
            this._rawPtr = null;
        }

        void updateState()
        {
            _buf = chdb_result_buffer(_rawPtr).fromStringz.to!string;
            _len = chdb_result_length(_rawPtr);
            _elapsed = chdb_result_elapsed(_rawPtr).to!long.dur!"seconds";
            _rows = chdb_result_rows_read(_rawPtr);
            _bytes = chdb_result_bytes_read(_rawPtr);
            _error = chdb_result_error(_rawPtr).fromStringz.to!string;
        }

        @property string buf()
        {
            return _buf;
        }

        @property size_t len()
        {
            return _len;
        }

        @property Duration elapsed()
        {
            return _elapsed;
        }

        @property string error()
        {
            return _error;
        }
}

struct StreamingQueryResult
{
    private:
        chdb_connection _rawConn;
        chdb_result * _rawStreamingPtr;
        QueryResult _partialQueryResult;
        string _streamingError;
        bool _isStreaming;

    public:
        this(chdb_connection initConn, chdb_result* initPtr, string initError)
        {
            _rawStreamingPtr = initPtr;
            _rawConn = initConn;
            _streamingError = initError;
            _partialQueryResult = QueryResult(chdb_stream_fetch_result(_rawConn, _rawStreamingPtr));
            _isStreaming = true;
        }

        @property ref QueryResult front()
        {
            return _partialQueryResult;
        }

        bool empty()
        {
            if (_partialQueryResult.len() == 0) {
                _isStreaming = false;
                return true;
            }
            return false;
        }

        void popFront()
        {
            _partialQueryResult._rawPtr = chdb_stream_fetch_result(_rawConn, _rawStreamingPtr);
            _partialQueryResult.updateState();
            _streamingError = _partialQueryResult.error();
        }

        ~this()
        {
            if (_isStreaming)
                cancel();
            chdb_destroy_query_result(_rawStreamingPtr);
            _rawStreamingPtr = null;
            // TODO: check if should _rawConn and _partialQueryResult 
            // also be destroyed and nullified
            //_partialQueryResult.destroy();
        }

        void cancel()
        {
            chdb_stream_cancel_query(_rawConn, _rawStreamingPtr);
            _isStreaming = false;
        }

        @property string error()
        {
            return _streamingError;
        }
}
