import std.stdio : writeln;
import std.conv : to;
import std.csv : csvReader;

import chdb.session;
import chdb.format;

void main() {
    auto sess = &Session.sessionInstance();
    sess.connect(":memory:");

    auto res = sess.query(`
    CREATE TABLE amazon_train
    (
        date Date MATERIALIZED today(),
        ACTION UInt8,
        RESOURCE UInt32,
        MGR_ID UInt32,
        ROLE_ROLLUP_1 UInt32,
        ROLE_ROLLUP_2 UInt32,
        ROLE_DEPTNAME UInt32,
        ROLE_TITLE UInt32,
        ROLE_FAMILY_DESC UInt32,
        ROLE_FAMILY UInt32,
        ROLE_CODE UInt32
    )
    ENGINE = MergeTree ORDER BY tuple()
    `, OutputFormat.CSVWithNames);
    writeln("Creation table error: ", res.error);

    res = sess.query(`INSERT INTO amazon_train FROM INFILE 'data/train.csv'`, OutputFormat.CSV);
    writeln("Insert data error: ", res.error);

    res = sess.query(`SELECT count() from amazon_train`, OutputFormat.CSV);
    writeln("Select count error: ", res.error);

    res = sess.query(`
    SELECT
        catboostEvaluate('cb_models/catboost_model.bin',
                      RESOURCE,
                      MGR_ID,
                      ROLE_ROLLUP_1,
                      ROLE_ROLLUP_2,
                      ROLE_DEPTNAME,
                      ROLE_TITLE,
                      ROLE_FAMILY_DESC,
                      ROLE_FAMILY,
                      ROLE_CODE) > 0 AS prediction,
        ACTION AS target
    FROM amazon_train
    LIMIT 10`, OutputFormat.CSV);
    writeln("---");
    writeln("Data: ", res.buf);
    writeln("Time elapsed: ", res.elapsed);
    writeln("Select count error: ", res.error);
    writeln("---");
}
