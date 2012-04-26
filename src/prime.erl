-module(prime).

-export([start/0, stop/0]).

start() ->
    application:start(prime).

stop() ->
   application:stop(prime).
