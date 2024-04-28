#! /bin/bash
#  2024.4.17
#  xiaoxiao
#  自动化部署：编写一个脚本以自动化部署应用程序或配置文件到多台服务器。可以使用 rsy   nc 命令和循环结构来实现。


#  定义了一个包含多台服务器名称的数组
servers=("server1" "server2" "server3")

source_dir="/path/to/source"
destination_dir="/path/to/destination"


#  在这个脚本中，${servers[@]} 是一个数组变量 servers 的扩展语法，用于获取数组中的    所有元素。${servers[@]} 中的 @ 表示获取整个数组，而不是数组的单个元素。

#  在 for 循环中，${servers[@]} 被用作循环的迭代对象，表示遍历数组 servers 中的每个   元素。在 Bash 中，使用 "${servers[@]}" 可以确保数组中的每个元素都作为一个单独的    参数传递给循环，即使元素中包含空格或其他特殊字符也能正确处理。
for server in "${servers[@]}"; do
    rsync -avz "$source_dir" "$server:$destination_dir"
done

#  rsync 是一个用于在两个目录之间同步文件和目录的命令行工具。它的全称是 "remote syn   chronization"。

#  -a 选项表示以归档模式进行同步，即保持文件属性、权限、链接等。
#  -v 选项表示以详细模式进行同步，会输出更多的信息。
#  -z 选项表示在传输时进行压缩，可以减少数据传输的大小，特别是在网络传输时。
#  "$source\_dir" 是源目录的路径，即要同步的文件或目录所在的位置。
#  "$server:$destination\_dir" 指定了目标地址，格式为 <服务器名或IP>:<目标路径>，表   示同步到远程服务器的目标路径下。



#  `rsync` 命令常用选项的全称及其作用：

#  `--archive` 或 `-a`: 归档模式，保留文件属性、权限、链接等。
#  `--verbose` 或 `-v`: 详细模式，输出更多的信息。
#  `--compress` 或 `-z`: 压缩传输数据，减少网络传输的大小。
#  `--delete`: 删除目标目录中不存在于源目录中的文件。
#  `--exclude`: 排除某些文件或目录，不进行同步。
#  `--dry-run`: 模拟同步过程，不进行实际的文件同步操作。
#  `--progress`: 显示同步进度。
#  `--update` 或 `-u`: 仅同步源目录中更新过的文件到目标目录。

#  这些选项可以根据具体的需求进行组合使用。
