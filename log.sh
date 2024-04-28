#! /bin/bash
#  2024.4.16
#  xiaoxiao
#  清理日志文件：编写一个脚本以清理旧的日志文件，保留最近的一段时间内的文件。可以使用 fi    nd 命令和条件语句来实现。


log_dir="/path/to/logs"

#  指定要保留的最近几天内的日志文件，这里设置为7天。
days_to_keep=7a



#  `find`: 命令用于在指定目录中查找文件和目录。
#  `"$log_dir"`: 表示要搜索的目录路径，这里使用了变量 `$log_dir`。
#  `-type f`: 表示查找的对象是文件（而不是目录）。
#  `-name "*.log"`: 表示查找文件名以 `.log` 结尾的文件。
#  `-mtime +$days_to_keep`: 表示查找最后修改时间早于 `$days_to_keep` 天的文件。`+` 表示     早于指定天数的文件，`$days_to_keep` 是要保留的最近几天内的文件数。
#  `-delete`: 表示删除找到的文件。

#  因此，整个命令的作用是在指定目录中查找最后修改时间早于指定天数的 `.log` 文件，并将它     们删除。
find "$log_dir" -type f -name "*.log" -mtime +$days_to_keep -delete



#  -mtime 是 find 命令的一个选项，用于指定文件的修改时间。
#  -mtime +N: 表示查找最后一次修改时间早于 N 天的文件。
#  -mtime N: 表示查找最后一次修改时间正好是 N 天前的文件。
#  -mtime -N: 表示查找最后一次修改时间晚于 N 天的文件。
#  其中，N 是一个整数，表示天数。

#  在这个脚本中，-mtime 选项用于指定文件的修改时间。具体来说，-mtime +$days_to_keep 表示    查找最后修改时间早于 $days_to_keep 天的文件。
