import std.stdio;
import std.conv : to;

import chdb.session;
import chdb.format;

void main() {
    auto session = &Session.sessionInstance();
    session.connect(":memory:");

    auto res = session.query(`
    
    `, OutputFormat.CSVWithNames);

    foreach (record; csvReader!(string[string])(res.buf, null))
        writefln("client #%s: found %s times and has mean value of feature_0: %1.3f",
                record["id"], record["row_count"],
                record["avg_feat_0"].to!float);
}
