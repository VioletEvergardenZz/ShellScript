#! /bin/bash
#  2024.4.17
#  xiaoxiao
#  监控磁盘空间：编写一个脚本以监控系统磁盘空间使用情况，并在空间不足时发送警报。     可以使用 df 命令和条件语句来实现


threshold=90
df_output=$(df -h)

#  `-r` 是 `read` 命令的一个选项，它告诉 `read` 命令不要处理反斜杠字符。在 `while r   ead -r line` 中，`-r` 选项确保 `read` 命令将每一行的内容原样读取，不会将反斜杠字   符解释为特殊字符。
#  在这个上下文中，"line" 是一个变量，用于存储 `df` 命令输出的每一行数据。在这个脚    本中，`while read -r line` 读取 `df` 命令的输出，并将每一行数据存储在名为 "line"   的变量中。

while read -r line; do

#  这个sed命令用于删除字符串中的百分号（%）。在这个脚本中，它被用于处理磁盘使用率的   数据，将其从带有百分号的形式转换为纯数字形式，以便后续比较。
#  在sed命令中，`s`是替换（substitute）操作的命令，用于替换字符串中的一部分内容。而   `/`是sed命令的分隔符，用于分隔不同部分，一般用在替换操作的语法中，例如`s/old/new   /`表示将字符串中的`old`替换为`new`。
#  `sed`是一种流编辑器，用于处理文本数据流。它主要用于对文本数据进行转换、替换、过    滤等操作。在`sed`中，`s`是替换命令，`/`是命令的分隔符，用于分隔命令的不同部分。    在替换命令中，`s`命令的语法通常是`s/要替换的内容/替换后的内容/`。`/`字符将这三个   部分分隔开来。
#  `'s/%//'`是`sed`命令的一部分，其中`s`表示替换命令，`%`是要查找和替换的模式，`//`   表示替换为空。这个命令的意思是将每一行中的`%`都替换为空，即删除所有的`%`字符。
    usage=$(echo "$line" | awk '{print $5}' | sed 's/%//')

    if (( usage > threshold )); then
        echo "磁盘空间不足: $line" | mail -s "磁盘空间警报" admin@example.com
    fi
done <<< "$df_output"

#  `<<<`是一种称为"Here String"的bash特性，用于将字符串提供给命令的标准输入。在这个   脚本中，`<<< "$df_output"`将`df_output`的内容提供给`while`循环作为输入，使得循环   可以逐行读取`df_output`中的内容。


#  `df -h` 是一个用于显示文件系统磁盘空间利用情况的命令。这个命令会列出当前系统中     所有挂载的文件系统的磁盘使用情况，包括文件系统的挂载点、总大小、已用空间、可用空   间、使用率等信息。

#  全称是：**disk free**

#  常用选项有：
#  `-h`:以易读的方式显示磁盘大小（例如使用 GB、MB 等单位）,而不是以块的数量来显示。
#  `-T`：显示文件系统类型。
#  `-t <文件系统类型>`：只显示指定类型的文件系统。
#  `-i`：显示 inode 使用情况。
#  `-a`：显示所有文件系统，包括没有内容的文件系统。
#  `-x <文件系统类型>`：排除指定类型的文件系统。--exclude-type=<文件系统类型>