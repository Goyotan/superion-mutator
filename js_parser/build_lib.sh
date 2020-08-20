#!/bin/bash

function usage {

cat <<EOM

    Usage: $(basename "$0") /path/to/AFL++/

EOM
exit 1
}

if [ $# -eq 0  ]
	then
		usage
fi

for f in *.cpp; do clang++ -fpermissive -I ../runtime/src/ -I $1 -c $f -fPIC -std=c++11 ; done
clang++ -fpermissive -shared -std=c++11 *.o ../dist/libantlr4-runtime.a  -o libTreeMutation.so
