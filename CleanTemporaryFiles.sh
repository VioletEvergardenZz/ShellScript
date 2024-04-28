#! /bin/bash
#  2024.4.17
#  xiaoxiao
#  清理临时文件：编写一个脚本以定期清理临时目录中的过期文件。可以使用 find 命令和条   件语句来实现。


temp_dir="/path/to/temp"

#  过期天数
expiration_days=3
find "$temp_dir" -type f -mtime +$expiration_days -delete
