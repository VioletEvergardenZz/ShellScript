#! /bin/bash
#  2024.4.17
#  xiaoxiao
#  监控网络连通性：编写一个脚本以监控关键网络服务的连通性，并在服务不可访问时发送警   报。可以使用 ping 命令和条件语句来实现。


service_ip="linux.cn"


#  ping -c 1 -W 1 "$service_ip" > /dev/null：这条命令执行了一个 ping 请求。其中：
#  -c 1 表示只发送一个 ICMP 包。
#  -W 1 表示设置超时时间为 1 秒。
#  "$service_ip" 是要 ping 的目标主机。
#  > /dev/null 将 ping 命令的输出重定向到 /dev/null，即丢弃掉标准输出和标准错误输出   ，只保留退出状态码。
#  ! ping -c 1 -W 1 "$service_ip" > /dev/null：在这个条件语句中，! 反转了 ping 命令   的退出状态码。如果 ping 命令返回非零状态码（表示无法访问），则条件为真。
if ! ping -c 1 -W 1 "$service_ip" > /dev/null; then
    echo "无法访问服务: $service_ip" | mail -s "网络连通性警报" admin@example.com
fi


#  ICMP（Internet Control Message Protocol）是互联网控制消息协议，用于在 IP 网络上    发送错误报告和操作信息。它通常用于网络诊断和错误报告。在这个上下文中，`ping` 命    令发送 ICMP 数据包来测试与指定主机的连接。

#  `-c` 是 `ping` 命令的选项，用于指定要发送的 ICMP 数据包的数量。
#  `-W` 是 `ping` 命令的选项，用于设置等待每个 ICMP 数据包的超时时间。
