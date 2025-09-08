import std.stdio : writeln;
import std.conv : to, text;
import std.file : write;
import std.csv : csvReader;

import chdb.session;
import chdb.format;

void main() {
    version (X86_64) {
        enum folderPath = "/app/example/catboost_integration/";
        enum libPath = "/app/examples/catboost_integration/cb_lib/libcatboostmodel-linux-x86-1.2.8.so";
    }
    else version (AArch64) {
        enum folderPath = "/app/example/catboost_integration/";
        enum libPath = "/app/examples/catboost_integration/cb_lib/libcatboostmodel-linux-aarch64-1.2.8.so";
    }
    else {
        enum folderPath = "unknown";
    }

    if (folderPath == "unknown") {
        writeln("Wrong architecture");
        return;
    }

    string config_str = i"<clickhouse>
    <listen_host>localhost</listen_host>
    <path>$(folderPath)</path>
    <tcp_port>9000</tcp_port>
    <http_port>8123</http_port>
    <users_config>users.xml</users_config>

    <catboost_lib_path>$(libPath)</catboost_lib_path>

    <library_bridge>
        <port>9019</port>
    </library_bridge>
</clickhouse>".text;

    write("config.xml", config_str);

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

    auto res = sess.query(`SELECT count() from amazon_train`, OutputFormat.CSV);
    writeln("Select count result: ", res.buf);
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
