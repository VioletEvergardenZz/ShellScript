#!  /bin/bash
#   2024.4.16
#   xiaoxiao
#   备份文件：编写一个脚本以定期备份指定目录的文件。可以使用 cp 命令和 cron 作业调度程序     来完成。


#  定义了备份文件存储目录的路径
backup_dir="/home/starry/backup"

#  定义了要备份的源文件目录的路径
source_dir="/home/starry/source"
timestamp=$(date +%Y%m%d%H%M%S)

#  生成备份文件的名称，格式为 backup_时间戳.tar.gz
backup_file="backup_$timestamp.tar.gz"


tar -czf "$backup_dir/$backup_file" "$source_dir"

#  tar: 打包或解包文件的工具。
#  c: 创建一个新的归档文件。
#  z: 使用 gzip 格式压缩归档文件。
#  f: 指定归档文件的名称。
#  "$backup_dir/$backup_file": 归档文件的路径和名称，由变量 $backup_dir 和 $backup_file     组合而成，用于指定归档文件的存储路径和名称。
#  "$source_dir": 要打包的源文件目录，由变量 $source_dir 指定。

#  在脚本中没有直接使用 cron，但是脚本的目的是定期备份指定目录的文件。为了实现定期备份，    可以将该脚本添加到 cron 作业调度程序中，并设置定时执行的时间。这样，cron 就会定期调用    脚本来执行备份操作
