module chdb.app;

import std.stdio;
import bindings;

void main() {
    load_bindings();
    writeln("Loaded library successfully");
}
