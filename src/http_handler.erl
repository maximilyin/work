-module(http_handler).
-export([handle_http/1]).


handle_http(Req) ->
    [{_, Value}|_] = Req:parse_qs(),
    N=list_to_integer(Value),
    Result=p31:is_prime(N),
    Req:ok(atom_to_list(Result)).

