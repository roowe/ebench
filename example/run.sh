#!/bin/bash
cd ../
rebar3 compile
cd example
rebar3 compile
erl -pa ../_build/default/lib/ebench/ebin/ -pa _build/default/lib/*/ebin  -noshell -name ebench@127.0.0.1 -boot start_clean -s json_bench -s init stop 

