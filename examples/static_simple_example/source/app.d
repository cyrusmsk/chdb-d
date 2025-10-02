import std.stdio;
import std.string : toStringz, fromStringz, empty;

import chdb.result;

void main() {
    auto argv = cast(char*)"--path=:memory:".toStringz;
    writeln("Before connect");
    auto conn = chdb_connect(1, &argv);
    writeln(conn);
    writeln(typeid(conn));

    //auto session = &Session.sessionInstance();
    //session.connect(":memory:");
    //auto res = session.query(`
    //SELECT * FROM numbers(1)
    //`, OutputFormat.TabSeparated);
    //write(res.buf);
    //writeln(res.len);
    //writeln(res.elapsed);
    //writeln("---");
}
