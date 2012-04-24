-module(prime).
-export([start/1, stop/0]).

start(Port) ->
	misultin:start_link([{port, Port}, {loop, fun(Req) -> handle_http(Req) end}]).

stop() ->
	misultin:stop().
is_prime(N) -> 
    is_prime(N,2).
is_prime(N,K) when K >= N/2 -> 
    N rem K =/= 0;
is_prime(N,K) when N rem K > 0 -> 
    is_prime(N,K+1);
is_prime(N,K) when N rem K =:= 0 -> 
    false.

handle_http(Req) ->
    [{_,N}|_] = Req:parse_qs(),
    Result=is_prime(N),
    Req:ok(atom_to_list(Result)).


