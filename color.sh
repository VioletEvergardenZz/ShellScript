#!/bin/bash
# This is echo color shell
# by author xiaoxiao
# 字体颜色
for i in {31..37};do
echo -e "\033[$i;40mstarry   Starry sky  别在这里发癫\033[0m"
done
# 背景颜色
for i in {41..47}; do
echo -e "\033[47;${i}mstarry   Starry sky  别在这里发癫\033[0m"
done
# 显示方式
for i in {1..8}; do
echo -e "\033[$i;31;40mstarry   Starry sky  别在这里发癫\033[0m"
done

