-ifndef(EBENCH_HRL).
-define(EBENCH_HRL, true).

-record(ebench_state, 
        {
         n = 0,
         t = 0, 
         start,
         timer_on = false
        }).

-endif.
