# Doris Performance Evaluation

## 配置
https://doris.apache.org/docs/get-starting/<br>
https://doris.apache.org/zh-CN/docs/install/install-deploy/

## TPCH setting
https://doris.apache.org/zh-CN/docs/benchmark/tpch
* 如果出现Memory limit exceeded错误，需要做如下修改
  * https://doris.apache.org/zh-CN/docs/data-table/basic-usage?_highlight=memory&_highlight=limit&_highlight=exceeded#%E5%86%85%E5%AD%98%E9%99%90%E5%88%B6, 修改后需要重启FE
  * 找到出现错误对应的/path/to/doris/tools/tpch-tools/queries/XXX.sql, 修改里面的exec_mem_limit数值
