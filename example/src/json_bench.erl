-module(json_bench).

%% API exports
-export([
         'jiffy_encode_simple_bench'/1,
         'jsone_encode_simple_bench'/1,
         'jsx_encode_simple_bench'/1,
         'jiffy_decode_simple_bench'/1,
         'jsone_decode_simple_bench'/1,
         'jsx_decode_simple_bench'/1,
         'jiffy_encode_blockchain_bench'/1,
         'jsone_encode_blockchain_bench'/1,
         'jsx_encode_blockchain_bench'/1,
         'jiffy_decode_blockchain_bench'/1,
         'jsone_decode_blockchain_bench'/1,
         'jsx_decode_blockchain_bench'/1,
         'jiffy_encode_giphy_bench'/1,
         'jsone_encode_giphy_bench'/1,
         'jsx_encode_giphy_bench'/1,
         'jiffy_decode_giphy_bench'/1,
         'jsone_decode_giphy_bench'/1,
         'jsx_decode_giphy_bench'/1,
         'jiffy_encode_github_bench'/1,
         'jsone_encode_github_bench'/1,
         'jsx_encode_github_bench'/1,
         'jiffy_decode_github_bench'/1,
         'jsone_decode_github_bench'/1,
         'jsx_decode_github_bench'/1,
         'jiffy_encode_govtrack_bench'/1,
         'jsone_encode_govtrack_bench'/1,
         'jsx_encode_govtrack_bench'/1,
         'jiffy_decode_govtrack_bench'/1,
         'jsone_decode_govtrack_bench'/1,
         'jsx_decode_govtrack_bench'/1,
         'jiffy_encode_issue-90_bench'/1,
         'jsone_encode_issue-90_bench'/1,
         'jsx_encode_issue-90_bench'/1,
         'jiffy_decode_issue-90_bench'/1,
         'jsone_decode_issue-90_bench'/1,
         'jsx_decode_issue-90_bench'/1,
         'jiffy_encode_json-generator_bench'/1,
         'jsone_encode_json-generator_bench'/1,
         'jsx_encode_json-generator_bench'/1,
         'jiffy_decode_json-generator_bench'/1,
         'jsone_decode_json-generator_bench'/1,
         'jsx_decode_json-generator_bench'/1,
         'jiffy_encode_json-generator-pretty_bench'/1,
         'jsone_encode_json-generator-pretty_bench'/1,
         'jsx_encode_json-generator-pretty_bench'/1,
         'jiffy_decode_json-generator-pretty_bench'/1,
         'jsone_decode_json-generator-pretty_bench'/1,
         'jsx_decode_json-generator-pretty_bench'/1,
         'jiffy_encode_pokedex_bench'/1,
         'jsone_encode_pokedex_bench'/1,
         'jsx_encode_pokedex_bench'/1,
         'jiffy_decode_pokedex_bench'/1,
         'jsone_decode_pokedex_bench'/1,
         'jsx_decode_pokedex_bench'/1,
         'jiffy_encode_utf-8-escaped_bench'/1,
         'jsone_encode_utf-8-escaped_bench'/1,
         'jsx_encode_utf-8-escaped_bench'/1,
         'jiffy_decode_utf-8-escaped_bench'/1,
         'jsone_decode_utf-8-escaped_bench'/1,
         'jsx_decode_utf-8-escaped_bench'/1,
         'jiffy_encode_utf-8-unescaped_bench'/1,
         'jsone_encode_utf-8-unescaped_bench'/1,
         'jsx_encode_utf-8-unescaped_bench'/1,
         'jiffy_decode_utf-8-unescaped_bench'/1,
         'jsone_decode_utf-8-unescaped_bench'/1,
         'jsx_decode_utf-8-unescaped_bench'/1,
         start/0
         %% jsone_encode_bench/1,
         %% jiffy_decode_bench/1,
         %% jsone_decode_bench/1
        ]).

-include("../include/ebench.hrl").

start() ->    
    ebench:run(?MODULE).


jiffy_encode_bench(S, File) ->
    %% io:format("b ~p~n", [S]),
    {ok, Bin} = file:read_file(File),
    JSON = jiffy:decode(Bin, [return_maps]),
    S1 = ebench:reset_timer(S),
    %%io:format("e ~p~n", [S1]),
    ebench:repeat_n(fun()->
                            jiffy:encode(JSON)
                    end, S1#ebench_state.n),
    S1.

jiffy_decode_bench(S, File) ->
    %% io:format("b ~p~n", [S]),
    {ok, Bin} = file:read_file(File),
    S1 = ebench:reset_timer(S),
    %%io:format("e ~p~n", [S1]),
    ebench:repeat_n(fun()->
                            jiffy:decode(Bin)
                    end, S1#ebench_state.n),
    S1.

jsone_encode_bench(S, File) ->
    %% io:format("b ~p~n", [S]),
    {ok, Bin} = file:read_file(File),
    JSON = jsone:decode(Bin),
    S1 = ebench:reset_timer(S),
    %%io:format("e ~p~n", [S1]),
    ebench:repeat_n(fun()->
                            jsone:encode(JSON)
                    end, S1#ebench_state.n),
    S1.

jsone_decode_bench(S, File) ->
    %% io:format("b ~p~n", [S]),
    {ok, Bin} = file:read_file(File),
    S1 = ebench:reset_timer(S),
    %%io:format("e ~p~n", [S1]),
    ebench:repeat_n(fun()->
                            jsone:decode(Bin)
                    end, S1#ebench_state.n),
    S1.

jsx_encode_bench(S, File) ->
    %% io:format("b ~p~n", [S]),
    {ok, Bin} = file:read_file(File),
    JSON = jsx:decode(Bin),
    S1 = ebench:reset_timer(S),
    %%io:format("e ~p~n", [S1]),
    ebench:repeat_n(fun()->
                            jsone:encode(JSON)
                    end, S1#ebench_state.n),
    S1.

jsx_decode_bench(S, File) ->
    %% io:format("b ~p~n", [S]),
    {ok, Bin} = file:read_file(File),
    S1 = ebench:reset_timer(S),
    %%io:format("e ~p~n", [S1]),
    ebench:repeat_n(fun()->
                            jsx:decode(Bin)
                    end, S1#ebench_state.n),
    S1.

'jiffy_encode_simple_bench'(S) ->
    jiffy_encode_bench(S, "data/simple.json").
'jsone_encode_simple_bench'(S) ->
    jsone_encode_bench(S, "data/simple.json").
'jsx_encode_simple_bench'(S) ->
    jsx_encode_bench(S, "data/simple.json").
'jiffy_decode_simple_bench'(S) ->
    jiffy_decode_bench(S, "data/simple.json").
'jsone_decode_simple_bench'(S) ->
    jsone_decode_bench(S, "data/simple.json").
'jsx_decode_simple_bench'(S) ->
    jsx_decode_bench(S, "data/simple.json").

'jiffy_encode_blockchain_bench'(S) ->
    jiffy_encode_bench(S, "data/blockchain.json").
'jsone_encode_blockchain_bench'(S) ->
    jsone_encode_bench(S, "data/blockchain.json").
'jsx_encode_blockchain_bench'(S) ->
    jsx_encode_bench(S, "data/blockchain.json").
'jiffy_decode_blockchain_bench'(S) ->
    jiffy_decode_bench(S, "data/blockchain.json").
'jsone_decode_blockchain_bench'(S) ->
    jsone_decode_bench(S, "data/blockchain.json").
'jsx_decode_blockchain_bench'(S) ->
    jsx_decode_bench(S, "data/blockchain.json").
'jiffy_encode_giphy_bench'(S) ->
    jiffy_encode_bench(S, "data/giphy.json").
'jsone_encode_giphy_bench'(S) ->
    jsone_encode_bench(S, "data/giphy.json").
'jsx_encode_giphy_bench'(S) ->
    jsx_encode_bench(S, "data/giphy.json").
'jiffy_decode_giphy_bench'(S) ->
    jiffy_decode_bench(S, "data/giphy.json").
'jsone_decode_giphy_bench'(S) ->
    jsone_decode_bench(S, "data/giphy.json").
'jsx_decode_giphy_bench'(S) ->
    jsx_decode_bench(S, "data/giphy.json").
'jiffy_encode_github_bench'(S) ->
    jiffy_encode_bench(S, "data/github.json").
'jsone_encode_github_bench'(S) ->
    jsone_encode_bench(S, "data/github.json").
'jsx_encode_github_bench'(S) ->
    jsx_encode_bench(S, "data/github.json").
'jiffy_decode_github_bench'(S) ->
    jiffy_decode_bench(S, "data/github.json").
'jsone_decode_github_bench'(S) ->
    jsone_decode_bench(S, "data/github.json").
'jsx_decode_github_bench'(S) ->
    jsx_decode_bench(S, "data/github.json").
'jiffy_encode_govtrack_bench'(S) ->
    jiffy_encode_bench(S, "data/govtrack.json").
'jsone_encode_govtrack_bench'(S) ->
    jsone_encode_bench(S, "data/govtrack.json").
'jsx_encode_govtrack_bench'(S) ->
    jsx_encode_bench(S, "data/govtrack.json").
'jiffy_decode_govtrack_bench'(S) ->
    jiffy_decode_bench(S, "data/govtrack.json").
'jsone_decode_govtrack_bench'(S) ->
    jsone_decode_bench(S, "data/govtrack.json").
'jsx_decode_govtrack_bench'(S) ->
    jsx_decode_bench(S, "data/govtrack.json").
'jiffy_encode_issue-90_bench'(S) ->
    jiffy_encode_bench(S, "data/issue-90.json").
'jsone_encode_issue-90_bench'(S) ->
    jsone_encode_bench(S, "data/issue-90.json").
'jsx_encode_issue-90_bench'(S) ->
    jsx_encode_bench(S, "data/issue-90.json").
'jiffy_decode_issue-90_bench'(S) ->
    jiffy_decode_bench(S, "data/issue-90.json").
'jsone_decode_issue-90_bench'(S) ->
    jsone_decode_bench(S, "data/issue-90.json").
'jsx_decode_issue-90_bench'(S) ->
    jsx_decode_bench(S, "data/issue-90.json").
'jiffy_encode_json-generator_bench'(S) ->
    jiffy_encode_bench(S, "data/json-generator.json").
'jsone_encode_json-generator_bench'(S) ->
    jsone_encode_bench(S, "data/json-generator.json").
'jsx_encode_json-generator_bench'(S) ->
    jsx_encode_bench(S, "data/json-generator.json").
'jiffy_decode_json-generator_bench'(S) ->
    jiffy_decode_bench(S, "data/json-generator.json").
'jsone_decode_json-generator_bench'(S) ->
    jsone_decode_bench(S, "data/json-generator.json").
'jsx_decode_json-generator_bench'(S) ->
    jsx_decode_bench(S, "data/json-generator.json").
'jiffy_encode_json-generator-pretty_bench'(S) ->
    jiffy_encode_bench(S, "data/json-generator-pretty.json").
'jsone_encode_json-generator-pretty_bench'(S) ->
    jsone_encode_bench(S, "data/json-generator-pretty.json").
'jsx_encode_json-generator-pretty_bench'(S) ->
    jsx_encode_bench(S, "data/json-generator-pretty.json").
'jiffy_decode_json-generator-pretty_bench'(S) ->
    jiffy_decode_bench(S, "data/json-generator-pretty.json").
'jsone_decode_json-generator-pretty_bench'(S) ->
    jsone_decode_bench(S, "data/json-generator-pretty.json").
'jsx_decode_json-generator-pretty_bench'(S) ->
    jsx_decode_bench(S, "data/json-generator-pretty.json").
'jiffy_encode_pokedex_bench'(S) ->
    jiffy_encode_bench(S, "data/pokedex.json").
'jsone_encode_pokedex_bench'(S) ->
    jsone_encode_bench(S, "data/pokedex.json").
'jsx_encode_pokedex_bench'(S) ->
    jsx_encode_bench(S, "data/pokedex.json").
'jiffy_decode_pokedex_bench'(S) ->
    jiffy_decode_bench(S, "data/pokedex.json").
'jsone_decode_pokedex_bench'(S) ->
    jsone_decode_bench(S, "data/pokedex.json").
'jsx_decode_pokedex_bench'(S) ->
    jsx_decode_bench(S, "data/pokedex.json").
'jiffy_encode_utf-8-escaped_bench'(S) ->
    jiffy_encode_bench(S, "data/utf-8-escaped.json").
'jsone_encode_utf-8-escaped_bench'(S) ->
    jsone_encode_bench(S, "data/utf-8-escaped.json").
'jsx_encode_utf-8-escaped_bench'(S) ->
    jsx_encode_bench(S, "data/utf-8-escaped.json").
'jiffy_decode_utf-8-escaped_bench'(S) ->
    jiffy_decode_bench(S, "data/utf-8-escaped.json").
'jsone_decode_utf-8-escaped_bench'(S) ->
    jsone_decode_bench(S, "data/utf-8-escaped.json").
'jsx_decode_utf-8-escaped_bench'(S) ->
    jsx_decode_bench(S, "data/utf-8-escaped.json").
'jiffy_encode_utf-8-unescaped_bench'(S) ->
    jiffy_encode_bench(S, "data/utf-8-unescaped.json").
'jsone_encode_utf-8-unescaped_bench'(S) ->
    jsone_encode_bench(S, "data/utf-8-unescaped.json").
'jsx_encode_utf-8-unescaped_bench'(S) ->
    jsx_encode_bench(S, "data/utf-8-unescaped.json").
'jiffy_decode_utf-8-unescaped_bench'(S) ->
    jiffy_decode_bench(S, "data/utf-8-unescaped.json").
'jsone_decode_utf-8-unescaped_bench'(S) ->
    jsone_decode_bench(S, "data/utf-8-unescaped.json").
'jsx_decode_utf-8-unescaped_bench'(S) ->
    jsx_decode_bench(S, "data/utf-8-unescaped.json").
