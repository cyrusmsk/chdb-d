import std.stdio;
import chdb.session;
import chdb.format;

void main() {
    auto session = &Session.sessionInstance();
    session.connect(":memory:");
    auto res = session.query("
    DESCRIBE s3(
        'https://datasets-documentation.s3.eu-west-3.amazonaws.com/amazon_reviews/amazon_reviews_2015.snappy.parquet', 
        ParquetMetadata
    )
    SETTINGS describe_compact_output=1", OutputFormat.TabSeparated);
    write(res.buf);
    writeln(res.len);
    writeln(res.elapsed);
    writeln("---");

    res = session.query("
    SELECT * EXCEPT(columns, row_groups)
    FROM s3(
        'https://datasets-documentation.s3.eu-west-3.amazonaws.com/amazon_reviews/amazon_reviews_2015.snappy.parquet', 
    ParquetMetadata
    )",  OutputFormat.Vertical);
    write(res.buf);
    writeln(res.len);
    writeln(res.elapsed);
    writeln(res.error);
    writeln("---");

    res = session.query("
    SELECT star_rating, count() AS count, formatReadableQuantity(count)
    FROM s3(
      'https://datasets-documentation.s3.eu-west-3.amazonaws.com/amazon_reviews/amazon_reviews_2015.snappy.parquet'
    )
    GROUP BY ALL
    ORDER BY star_rating
    ",  OutputFormat.TabSeparated);
    write(res.buf);
    writeln(res.len);
    writeln(res.elapsed);
    writeln(res.error);
}
