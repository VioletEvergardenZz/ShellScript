#! /bin/bash
#  2024.4.17
#  xioaxiao
#  批量重命名文件：编写一个脚本以批量重命名目录中的文件。可以使用循环结构和 mv 命令   来实现。


directory="/path/to/files"
prefix="new_file"

#  count=1：设置初始计数值。
count=1

#  "$directory"/* 是一个通配符表达式，表示匹配目录 `$directory` 中的所有文件。`*`     是通配符，表示匹配任意数量的字符，包括零个字符。
#  在这个上下文中，`/*` 表示匹配 `$directory` 目录下的所有文件，包括子目录中的文件

for file in "$directory"/*; do
    new_file_name="$directory/$prefix$count"
    mv "$file" "$new_file_name"
    ((count++))
done
