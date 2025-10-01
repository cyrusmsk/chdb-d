import std.stdio;
import std.string : toStringz, fromStringz, empty;

import chdb_original;

void main() {
    auto argv = cast(char*)"--path=:memory:".toStringz;
    chdb_connection* conn = chdb_connect(1, &argv);
    writeln(conn);
    writeln(typeid(conn));
}
