import std.stdio;
import chdb.session;
import chdb.format;

void main() {
    auto session = &Session.sessionInstance();
    session.connect(":memory:");
    auto res = session.query("select version()", OutputFormat.CSV);
    write(res.buf);
    writeln(res.len);
    writeln(res.elapsed);
}
