#! /bin/bash
#  2024.4.15 
#  xiaoxiao
# Function: 根据输入的程序的名字过滤出所对应的PID，并显示出详细信息，如果有几个PID，则全部显示

read -p "请输入要查询的进程名: " NAME

#$(...) 语法用于执行命令并将其结果赋给变量
#-v 是 grep 命令的一个选项，用于反转匹配，即只输出不匹配的行。在这个脚本中，grep -v grep 的作用是从 ps -aux 的输出中移除包含字符串 "grep" 的行。这样做是为了避免 ps -aux 命令本身也被 grep 命令匹配到，从而保证最终统计的进程数量准确。
N=$(ps -aux | grep "$NAME" | grep -v grep | wc -l)

if [ $N -le 0 ]; then
    echo "该进程名没有运行! " 
fi

#这行命令用于初始化一个循环计数器 i，从 1 开始
i=1
ps_result=$(ps -aux | grep "$NAME" | grep -v grep)

while [ $N -gt 0 ]; do

    #NR==$i：这是一个条件，表示如果当前处理的行号（NR）等于变量 i 的值。
    #{print \$2}：这是一个动作，表示如果条件成立，则打印当前行的第二个字段（$2）。
    #NR 在 AWK 中是一个预定义变量，代表当前处理的行号（line number）。所以 NR==$i 表     示当前处理的行号等于变量 i 的值时，执行对应的动作。
    echo "进程PID: $(echo "$ps_result" | awk "NR==$i{print \$2}")"
    echo "进程命令: $(echo "$ps_result" | awk "NR==$i{print \$11}")"
    echo "进程所属用户: $(echo "$ps_result" | awk "NR==$i{print \$1}")"
    echo "CPU占用率: $(echo "$ps_result" | awk "NR==$i{print \$3}")%"
    echo "内存占用率: $(echo "$ps_result" | awk "NR==$i{print \$4}")%"
    echo "进程开始运行的时刻: $(echo "$ps_result" | awk "NR==$i{print \$9}")"
    echo "进程运行的时间: $(echo "$ps_result" | awk "NR==$i{print \$10}")"
    echo "进程状态: $(echo "$ps_result" | awk "NR==$i{print \$8}")"
    echo "进程虚拟内存: $(echo "$ps_result" | awk "NR==$i{print \$5}")"
    echo "进程共享内存: $(echo "$ps_result" | awk "NR==$i{print \$6}")"
    echo "***************************************************************"

    #在Shell中，双圆括号 ((...)) 用于进行算术运算和赋值操作，而不产生一个新的进程。      在这里，((N--)) 表示将变量 N 的值减 1，并将结果赋给变量 N。
    ((N--))
    ((i++))
done

#awk 是一个文本处理工具，用于在文本文件中进行逐行处理。让我逐步解释这个命令

#在Shell中，let 和 ((...)) 都用于执行算术运算，它们的功能是类似的。因此，let N-- 和  ((N--)) 都是将变量 N 的值减 1。相比之下，let 更适用于简单的算术运算，而 ((...)) 更  强大，可以处理更复杂的算术表达式，并且可以省略变量名之前的 $ 符号。



#echo "进程PID: $(echo"$ps_result"|awk "NR==$i{print \$2}")"
#awk 命令后面的双引号是用来引用 awk 命令的参数的
