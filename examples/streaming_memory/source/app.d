import std;
import chdb.session;
import chdb.format;

auto resultCounterStreaming1 = 0;
auto resultCounterStreaming2 = 0;
auto resultCounterNormal1= 0;
auto resultCounterNormal2= 0;

void main() {
    auto session = &Session.sessionInstance();
    session.connect(":memory:");
    auto res = session.query("
    CREATE DATABASE IF NOT EXISTS test;
    USE test;
    CREATE TABLE IF NOT EXISTS streaming_test (id Int64) ENGINE = MergeTree() ORDER BY id;
    INSERT INTO streaming_test SELECT number FROM numbers(1000000)
    ", OutputFormat.CSV);
    write(res.buf);
    writeln(res.len);
    writeln(res.elapsed);
    writeln("---");

    long total_rows = 0;
    foreach(ref ch; session.streamingQuery("SELECT * FROM streaming_test", OutputFormat.CSVWithNames))
    {
        total_rows += ch.buf().split("\n").length - 2;
    }
    writeln(total_rows);
}
