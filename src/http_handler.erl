-module(http_handler).
-export([handle_http/1]).



handle_http(Req) ->
    handle_http(Req:get(method), Req:parse_qs(), Req).

handle_http('GET', [{_, Value}|_], Req) -> 
try 
    N=list_to_integer(Value), 
    Result=p31:is_prime(N),
    Req:ok(atom_to_list(Result))
catch 
    _:_->
        Req:respond(404, "Not Found")
end;
handle_http(_,_,Req) ->
    Req:respond(404, "Not Found").


