#! /bin/bash
#  2024.4.16
#  xiaoxiao
#  监控服务状态：编写一个脚本以监控关键服务的运行状态，并在服务异常时发送警报。可以使用 s   ystemctl 命令和条件语句来实现。


service_name="nginx"
if ! systemctl is-active --quiet "$service_name"; then
    echo "服务 $service_name 未运行" | mail -s "服务状态警报" admin@example.com
fi



#  systemctl is-active --quiet "$service_name"：这部分是用来检查指定服务的状态的命令。sys   temctl 是 Linux 系统中用于控制 systemd 服务的命令，is-active 参数用于检查服务是否处于    活动状态，--quiet 参数表示安静模式，即不产生输出，直接返回退出状态码。"$service_name"    是要检查的服务的名称，这里使用变量 $service_name，在这个例子中是 "nginx"。

#  !：在这里是逻辑非运算符，它的作用是对检查服务状态的命令的返回结果取反。如果检查服务状    态的命令返回状态码为 0（表示服务处于活动状态），则 ! 运算符会将其结果变为 false，如果    返回状态码非 0（表示服务未处于活动状态），则 ! 运算符会将其结果变为 true。

#  then：条件语句的关键词，用于指定如果条件为真时要执行的操作。
