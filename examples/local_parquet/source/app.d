import std.stdio;
import chdb.session;
import chdb.format;

void main() {
    auto session = &Session.sessionInstance();
    session.connect(":memory:");
    auto res = session.query(`
    DESCRIBE 
    file("data/sample.parquet", "PARQUET")
    SETTINGS describe_compact_output=1`, OutputFormat.TabSeparated);
    write(res.buf);
    writeln(res.len);
    writeln(res.elapsed);
    writeln("---");

    res = session.query(`
    WITH numericColumns AS (
    SELECT * EXCEPT ('tile.*') EXCEPT(quadkey)
    FROM
    file("data/sample.parquet", "PARQUET")
    )
    SELECT * APPLY(max), * APPLY(avg) APPLY(x -> round(x, 2))
    FROM numericColumns 
    `,  OutputFormat.Vertical);
    write(res.buf);
    writeln(res.len);
    writeln(res.elapsed);
    writeln(res.error);
}
