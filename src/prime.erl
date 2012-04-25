-module(prime).
-export([start/1, stop/0]).

start(Port) ->
	misultin:start_link([{port, Port}, {loop, fun(Req) -> handle_http(Req) end}]).

stop() ->
	misultin:stop().

handle_http(Req) ->
    [{_, Value}|_] = Req:parse_qs(),
    N=list_to_integer(Value),
    Result=p31:is_prime(N),
    Req:ok(atom_to_list(Result)).

