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
                     jiffy_encode_blockchain_bench:     20000    155372.26 ns/op
                     jsone_encode_blockchain_bench:      5000    653255.61 ns/op
                       jsx_encode_blockchain_bench:      5000    667277.13 ns/op
                     jiffy_decode_blockchain_bench:     20000    138986.98 ns/op
                     jsone_decode_blockchain_bench:     10000    482519.53 ns/op
                       jsx_decode_blockchain_bench:      5000    598609.59 ns/op
                          jiffy_encode_giphy_bench:      3000   1311210.10 ns/op
                          jsone_encode_giphy_bench:       500   6386177.02 ns/op
                            jsx_encode_giphy_bench:       500   6317128.51 ns/op
                          jiffy_decode_giphy_bench:      5000    813146.31 ns/op
                          jsone_decode_giphy_bench:      1000   5267881.98 ns/op
                            jsx_decode_giphy_bench:       500   6287533.41 ns/op
                         jiffy_encode_github_bench:     10000    449038.91 ns/op
                         jsone_encode_github_bench:      2000   2525542.63 ns/op
                           jsx_encode_github_bench:      2000   2556174.25 ns/op
                         jiffy_decode_github_bench:     10000    315173.47 ns/op
                         jsone_decode_github_bench:      2000   1487717.19 ns/op
                           jsx_decode_github_bench:      2000   2161903.08 ns/op
                       jiffy_encode_govtrack_bench:       100  39319624.52 ns/op
                       jsone_encode_govtrack_bench:        10 300640639.60 ns/op
                         jsx_encode_govtrack_bench:        10 361945993.10 ns/op
                       jiffy_decode_govtrack_bench:       100  37072898.13 ns/op
                       jsone_decode_govtrack_bench:        20 183669745.70 ns/op
                         jsx_decode_govtrack_bench:        10 326714970.50 ns/op
                     'jiffy_encode_issue-90_bench':        50  50403585.14 ns/op
                     'jsone_encode_issue-90_bench':         5 470184461.00 ns/op
                       'jsx_encode_issue-90_bench':         5 463289545.40 ns/op
                     'jiffy_decode_issue-90_bench':       200  17442475.91 ns/op
                     'jsone_decode_issue-90_bench':        20 156882541.85 ns/op
                       'jsx_decode_issue-90_bench':        20 126689155.90 ns/op
               'jiffy_encode_json-generator_bench':      2000   1588761.68 ns/op
               'jsone_encode_json-generator_bench':       500   5963333.95 ns/op
                 'jsx_encode_json-generator_bench':       500   6120385.81 ns/op
               'jiffy_decode_json-generator_bench':      5000    767141.20 ns/op
               'jsone_decode_json-generator_bench':      1000   3859448.96 ns/op
                 'jsx_decode_json-generator_bench':      1000   4694434.55 ns/op
        'jiffy_encode_json-generator-pretty_bench':      2000   1609639.55 ns/op
        'jsone_encode_json-generator-pretty_bench':       500   6102127.20 ns/op
          'jsx_encode_json-generator-pretty_bench':       500   6040702.95 ns/op
        'jiffy_decode_json-generator-pretty_bench':      3000   1406041.67 ns/op
        'jsone_decode_json-generator-pretty_bench':      1000   4376667.57 ns/op
          'jsx_decode_json-generator-pretty_bench':       500   6299894.41 ns/op
                        jiffy_encode_pokedex_bench:      3000   1039260.03 ns/op
                        jsone_encode_pokedex_bench:      1000   3102631.51 ns/op
                          jsx_encode_pokedex_bench:      1000   3047124.66 ns/op
                        jiffy_decode_pokedex_bench:      5000    611460.92 ns/op
                        jsone_decode_pokedex_bench:      2000   2581700.57 ns/op
                          jsx_decode_pokedex_bench:      1000   3659191.55 ns/op
                'jiffy_encode_utf-8-escaped_bench':     50000     97554.32 ns/op
                'jsone_encode_utf-8-escaped_bench':      5000    635300.68 ns/op
                  'jsx_encode_utf-8-escaped_bench':      5000    630018.84 ns/op
                'jiffy_decode_utf-8-escaped_bench':     50000     79799.91 ns/op
                'jsone_decode_utf-8-escaped_bench':      3000   1303065.16 ns/op
                  'jsx_decode_utf-8-escaped_bench':      2000   1507484.16 ns/op
              'jiffy_encode_utf-8-unescaped_bench':     50000     92873.05 ns/op
              'jsone_encode_utf-8-unescaped_bench':      5000    613629.77 ns/op
                'jsx_encode_utf-8-unescaped_bench':      5000    610604.93 ns/op
              'jiffy_decode_utf-8-unescaped_bench':    100000     55002.76 ns/op
              'jsone_decode_utf-8-unescaped_bench':     20000    286794.89 ns/op
                'jsx_decode_utf-8-unescaped_bench':     20000    230383.39 ns/op

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

