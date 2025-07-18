module chdb.session;

import chdb.result;

private import chdb.bindings;

import std.string : toStringz, fromStringz, empty;
import std.conv : to;
import std.stdio : writeln;

struct Session
{
    private:
        static Session _localSession;

        chdb_connection* _conn;
        bool _isConnected;
        bool _isTemp;
        string _dataPath;

        @disable this();
        @disable this(this);

    public:
        chdb_connection getConnection()
        {
            if (_isConnected)
                return *_conn;
            else {
                writeln("Connection is not established");
                return null;
            }
        }
        @property static ref sessionInstance()
        {
            load_bindings();
            return _localSession;
        }

        void connect(string dataPath)
        {
            // Check if there is no current connections
            if (_isConnected && _dataPath != dataPath)
            {
                disconnect();
            }

            if (empty(dataPath))
            {
                // TODO: use Path to generate Temprorary path
                _dataPath = "./";
            }
            else {
                // TODO: check that the path is existing
                _dataPath = dataPath;
            }

            auto argv = cast(char*)("--path="~_dataPath).toStringz;
            _conn = chdb_connect(1, &argv);
            _isConnected = true;
        }

        static ~this()
        {
            _localSession.disconnect();
        }

        void disconnect()
        {
            if (_isTemp)
            {
                writeln("Clean temporary folder");
                cleanUp();
            }
            if (_isConnected)
            {
                chdb_close_conn(_conn);
            }
            _conn = null;
            _dataPath = "";
            _isConnected = false;
        }

        void cleanUp()
        {
            // TODO: Remove folder
            writeln("Removing folder");
        }

        QueryResult query(string queryStr, string outputFormat)
        {
            if (empty(outputFormat))
                outputFormat = "CSV";
            chdb_result* tmp_res;
            try
            {
                tmp_res = chdb_query(getConnection(), queryStr.toStringz, outputFormat.toStringz);
            }
            catch (Exception e)
            {
                writeln("Error instantiated while query execution");
            }

            return QueryResult(tmp_res);
        }

        StreamingQueryResult streamingQuery(string queryStr, string outputFormat)
        {
            if (empty(outputFormat))
                outputFormat = "CSV";
            chdb_result* streaming_tmp_res;
            auto connection = this.getConnection(); // should it be const/immutable?
            try
            {
                streaming_tmp_res = chdb_stream_query(connection, queryStr.toStringz, outputFormat.toStringz);
            }
            catch (Exception e)
            {
                writeln("Exception instantiated while streaming query execution");
            }

            string tmpError = chdb_result_error(streaming_tmp_res).fromStringz.to!string;
            return StreamingQueryResult(connection, streaming_tmp_res, tmpError);
        }
}
