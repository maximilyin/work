-module(p31).
-export([is_prime/1]).



is_prime(1) ->
    false;
is_prime(2) ->
    true;
is_prime(N) ->
    is_prime(N, 2).


is_prime(N, K) when K > N/2 ->
    N rem K =/=0;
is_prime(N, K) when N rem K > 0 ->
    is_prime(N, K+1);
is_prime(N, K) when N rem K =:= 0 ->
    false.
