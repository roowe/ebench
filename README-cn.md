# ebench

erlang的bench工具。





## 功能

将模块的_bench后缀的函数进行多次运算，计算运算时间。



但是目前实现完成度不高。暂不支持

- 并行
- 多模块
- 没有友好的命令行

等等。



## QuickStart

请先安装 [rebar3](https://www.rebar3.org/)。

```sh
$ git clone https://github.com/roowe/ebench
$ cd ebench/example
$  ./run.sh
```

参考结果：

```
                         jiffy_encode_simple_bench:   1000000      2731.92 ns/op
                         jsone_encode_simple_bench:    300000      8985.88 ns/op
                           jsx_encode_simple_bench:    500000      9013.57 ns/op
                         jiffy_decode_simple_bench:   2000000      1496.16 ns/op
                         jsone_decode_simple_bench:    500000      5942.48 ns/op
                           jsx_decode_simple_bench:    500000      8594.12 ns/op
                     jiffy_encode_blockchain_bench:     20000    155932.19 ns/op
                     jsone_encode_blockchain_bench:      5000    689349.69 ns/op
                       jsx_encode_blockchain_bench:      5000    684389.61 ns/op
                     jiffy_decode_blockchain_bench:     20000    136638.03 ns/op
                     jsone_decode_blockchain_bench:     10000    472161.21 ns/op
                       jsx_decode_blockchain_bench:     10000    575905.93 ns/op
                          jiffy_encode_giphy_bench:      3000   1291377.93 ns/op
                          jsone_encode_giphy_bench:       500   6220591.27 ns/op
                            jsx_encode_giphy_bench:       500   6235947.00 ns/op
                          jiffy_decode_giphy_bench:      5000    772777.30 ns/op
                          jsone_decode_giphy_bench:      1000   4934926.25 ns/op
                            jsx_decode_giphy_bench:       500   6033596.49 ns/op
                         jiffy_encode_github_bench:     10000    417029.20 ns/op
                         jsone_encode_github_bench:      2000   2379080.84 ns/op
                           jsx_encode_github_bench:      2000   2385339.67 ns/op
                         jiffy_decode_github_bench:     10000    296833.96 ns/op
                         jsone_decode_github_bench:      3000   1375388.11 ns/op
                           jsx_decode_github_bench:      2000   2030179.24 ns/op
                       jiffy_encode_govtrack_bench:       100  36386186.07 ns/op
                       jsone_encode_govtrack_bench:        10 275092008.50 ns/op
                         jsx_encode_govtrack_bench:        10 324309595.20 ns/op
                       jiffy_decode_govtrack_bench:       100  33674810.50 ns/op
                       jsone_decode_govtrack_bench:        20 180359978.95 ns/op
                         jsx_decode_govtrack_bench:        10 306195729.50 ns/op
                     'jiffy_encode_issue-90_bench':        50  48938490.66 ns/op
                     'jsone_encode_issue-90_bench':         5 484371746.00 ns/op
                       'jsx_encode_issue-90_bench':         5 477557479.00 ns/op
                     'jiffy_decode_issue-90_bench':       200  17405798.60 ns/op
                     'jsone_decode_issue-90_bench':        20 156150124.70 ns/op
                       'jsx_decode_issue-90_bench':        20 124928047.80 ns/op
               'jiffy_encode_json-generator_bench':      2000   1556455.91 ns/op
               'jsone_encode_json-generator_bench':       500   6211973.25 ns/op
                 'jsx_encode_json-generator_bench':       500   6217135.98 ns/op
               'jiffy_decode_json-generator_bench':      5000    743216.23 ns/op
               'jsone_decode_json-generator_bench':      1000   3904469.82 ns/op
                 'jsx_decode_json-generator_bench':      1000   4724435.79 ns/op
        'jiffy_encode_json-generator-pretty_bench':      2000   1533535.31 ns/op
        'jsone_encode_json-generator-pretty_bench':       500   5906410.12 ns/op
          'jsx_encode_json-generator-pretty_bench':       500   5935538.59 ns/op
        'jiffy_decode_json-generator-pretty_bench':      3000   1371932.31 ns/op
        'jsone_decode_json-generator-pretty_bench':      1000   4273056.99 ns/op
          'jsx_decode_json-generator-pretty_bench':      1000   5529378.02 ns/op
                        jiffy_encode_pokedex_bench:      3000   1027406.70 ns/op
                        jsone_encode_pokedex_bench:      1000   3050870.66 ns/op
                          jsx_encode_pokedex_bench:      1000   3027114.75 ns/op
                        jiffy_decode_pokedex_bench:      5000    614745.55 ns/op
                        jsone_decode_pokedex_bench:      2000   2491916.92 ns/op
                          jsx_decode_pokedex_bench:      1000   3489407.52 ns/op
                'jiffy_encode_utf-8-escaped_bench':     50000     95310.53 ns/op
                'jsone_encode_utf-8-escaped_bench':      5000    625544.92 ns/op
                  'jsx_encode_utf-8-escaped_bench':      5000    628372.06 ns/op
                'jiffy_decode_utf-8-escaped_bench':     50000     79538.08 ns/op
                'jsone_decode_utf-8-escaped_bench':      3000   1276475.83 ns/op
                  'jsx_decode_utf-8-escaped_bench':      2000   1537276.84 ns/op
              'jiffy_encode_utf-8-unescaped_bench':     50000     91786.04 ns/op
              'jsone_encode_utf-8-unescaped_bench':      5000    609052.07 ns/op
                'jsx_encode_utf-8-unescaped_bench':      5000    610092.10 ns/op
              'jiffy_decode_utf-8-unescaped_bench':    100000     54094.97 ns/op
              'jsone_decode_utf-8-unescaped_bench':     10000    283257.76 ns/op
                'jsx_decode_utf-8-unescaped_bench':     20000    228146.85 ns/op

```



## Usage Example



```erlang
list_sum_bench(S) ->
    L = lists:seq(10, 100),
    S1 = ebench:reset_timer(S),
    %%io:format("e ~p~n", [S1]),
    ebench:repeat_n(fun()->
                            lists:sum(L)
                    end, S1#ebench_state.n),
    S1.

```

