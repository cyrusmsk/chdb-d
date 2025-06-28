import std.stdio;
import std.conv : to;
import std.csv : csvReader;

import chdb.session;
import chdb.format;

void main() {
    auto session = &Session.sessionInstance();
    session.connect(":memory:");

    auto res = session.query(`
    SELECT
        id,
        count() AS row_count,
        avg(feat_0) as avg_feat_0,
        median(feat_1) as med_feat_1,
        quantile(0.25)(feat_2) as quant_25_feat_2
    FROM file("sample.csv", "CSV")
    GROUP BY id
    ORDER BY id
    `, InputFormat.CSVWithNames);

    foreach (record; csvReader!(string[string])(res.buf, null))
        writefln("client #%s: found %s times and has mean value of feature_0: %1.3f",
                record["id"], record["row_count"],
                record["avg_feat_0"].to!float);
}
