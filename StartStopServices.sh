#! /bin/bash
#  2024.4.17
#  xiaoxiao
#  启动/停止服务：编写一个脚本以同时启动或停止多个服务。可以使用 systemctl 命令和循   环结构来实现。


# 数组
services=("service1" "service2" "service3")
action="start"  # 或者 "stop"
for service in "${services[@]}"; do
    systemctl "$action" "$service"
done
