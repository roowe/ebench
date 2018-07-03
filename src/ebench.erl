-module(ebench).

-export([start_timer/1, stop_timer/1, reset_timer/1,
         repeat_n/2, run/1]).

-include("ebench.hrl").

start_timer(S) ->
    if 
        S#ebench_state.timer_on == false ->
            S#ebench_state{
              start = erlang:monotonic_time(),
              timer_on = true
             };
        true ->
            S
    end.

stop_timer(S) ->
    if 
        S#ebench_state.timer_on == true ->
            T = erlang:convert_time_unit(
                  erlang:monotonic_time() - S#ebench_state.start,
                  native, nanosecond),
            %%io:format("t=~p, n=~p~n", [T, S#ebench_state.n]),
            S#ebench_state{
              t = T,
              timer_on = false
             };
        true ->
            S
    end.

reset_timer(S) ->
    S1 = if 
             S#ebench_state.timer_on == true ->
                 S#ebench_state{
                   start = erlang:monotonic_time()
                  };
             true ->
                 S
         end,
    S1#ebench_state{
      t = 0
     }.    

run(Mod) ->
    PropList = Mod:module_info(),
    Exps = proplists:get_value(exports, PropList, []),
    [run(Mod, Exp, #ebench_state{n=1}) ||
        {Exp, 1} <- Exps,
        lists:suffix("_bench", atom_to_list(Exp))],
    ok.

-define(BENCH_TIME_NS, 2000000000).

run(Mod, Fun, S0) ->    
    S1 = run_fun(Mod, Fun, S0),
    if 
        S1#ebench_state.t > ?BENCH_TIME_NS ->
            %% 5s
            print_bench_result(Mod, Fun, S1);
        S1#ebench_state.n > 1000000000 ->
            print_bench_result(Mod, Fun, S1);
        true ->
            S2 = next_ns(S1#ebench_state{
                           n = S1#ebench_state.n + S1#ebench_state.n div 5
                          }),
            run(Mod, Fun, S2)
    end.

next_ns(#ebench_state{
           n = OldN
          } = S) ->    
    NsOp = S#ebench_state.t/OldN,
    N = erlang:trunc(?BENCH_TIME_NS / NsOp),
    S#ebench_state{
      n = round_up(max(min(N + N div 5, 100*OldN), OldN+1))
     }.    

print_bench_result(_Mod, Fun, 
                   #ebench_state{
                      t = T,
                      n = N
                     }) ->        
    io:format("~50w:~10w~13.2f ns/op~n", [Fun, N, T/N]).

run_fun(Mod, Fun, S) ->
    S1 = start_timer(reset_timer(S)),
    S2 = Mod:Fun(S1),
    S3 = stop_timer(S2),
    S3.   

repeat_n(_, 0) ->
    ok;
repeat_n(Fun, 1) ->
    Fun();
repeat_n(Fun, N) ->
    Fun(),
    repeat_n(Fun, N-1).

round_down10(N) ->
    erlang:trunc(math:pow(10, math:floor(math:log10(N)))).

round_up(N) ->
	Base = round_down10(N),   
    %%io:format("~p~n", [Base]),
	if 
        N =< Base ->
            Base;
        N =< (2 * Base) ->
            2 * Base;
        N =< (3 * Base) ->
            3 * Base;
        N =< (5 * Base) ->
            5 * Base;
        true ->
            10 * Base
	end.

