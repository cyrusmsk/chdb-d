module chdb.session;

import chdb.result;

private import bindings;

import std.string : toStringz, empty;
import std.stdio : writeln;

struct Session
{
    private:
        static Session _localSession;

        chdb_connection* _conn;
        bool _isConnected;
        string _dataPath;
        bool _isTemp;

        @disable this();
        @disable this(this);

        chdb_connection getConnection()
        {
            if (_isConnected)
                return *_conn;
            else {
                writeln("Connection is not established");
                return null;
            }
        }

    public:
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
}
