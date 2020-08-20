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

#echo "[*] AFL++ path:  $1"


echo "[*] Building ANTLR runtime..."
cmake ./
make -j4

echo "[*] Building js_parser..."
cd js_parser

for f in *.cpp; do g++ -I ../runtime/src -I $1 -c $f -fPIC -std=c++11; done

g++  -shared -std=c++11 *.o ../dist/libantlr4-runtime.a  -o libTreeMutation.so

cd ..

echo "[*] Done"


