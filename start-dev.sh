#!/bin/sh
erl -pa $PWD/ebin -pa $PWD/deps/*/ebin -sname mega_server
