select/*+SET_VAR(exec_mem_limit=17179869184, parallel_fragment_exec_instance_num=16, enable_vectorized_engine=true, batch_size=4096, disable_join_reorder=false, enable_cost_based_join_reorder=false, enable_projection=true,  runtime_filter_wait_time_ms=10000, enable_profile=true) */
    nation,
    o_year,
    sum(amount) as sum_profit
from
    (
        select
            n_name as nation,
            extract(year from o_orderdate) as o_year,
            l_extendedprice * (1 - l_discount) - ps_supplycost * l_quantity as amount
        from
            lineitem join orders on o_orderkey = l_orderkey
            join[shuffle] part on p_partkey = l_partkey
            join[shuffle] partsupp on ps_partkey = l_partkey
            join[shuffle] supplier on s_suppkey = l_suppkey
            join[broadcast] nation on s_nationkey = n_nationkey
        where
            ps_suppkey = l_suppkey and
            p_name like '%green%'
    ) as profit
group by
    nation,
    o_year
order by
    nation,
    o_year desc;
