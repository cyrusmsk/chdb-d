import std.stdio;
import chdb.session;

void main() {
    auto session = &Session.sessionInstance();
    session.connect(":memory:");
    auto res = session.query("select version()", "CSV");
    write(res.buf);
    writeln(res.len);
    writeln(res.elapsed);
}
