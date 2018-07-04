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

