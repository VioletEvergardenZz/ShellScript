#! /bin/bash
#  2024.4.15
#  xiaoxiao
#  Function：根据用户名查询该用户的所有信息

read -p "请输入要查询的用户名：" A
echo "------------------------------"

#-F: 这个选项告诉awk命令使用:作为字段分隔符。
#$A 前后的单引号的作用是确保在 awk 的模式中将 $A 视为一个字符串，而不是一个变量
#/{print} 是 awk 中的动作部分，表示当模式匹配成功时要执行的操作。在这个命令中，{print} 表示打印 匹配到的行。因此，整个 awk 命令的含义是：当第一个字段与变量 $A 的值相等时，打印匹配到的行。
n=$(cat /etc/passwd | awk -F: '$1~/^'$A'$/{print}' | wc -l)
if [ $n -eq 0 ]; then
    echo "该用户不存在"
    echo "------------------------------"
else
    echo "该用户的用户名: $A"
    echo "该用户的UID: $(cat /etc/passwd |awk -F: '$1~/^'$A'$/{print}' | awk -F: '{print $3}')"

    #id $A：这个部分使用 id 命令获取指定用户名 $A 的用户信息。
    echo "该用户的组为: $(id $A | awk '{print $3}')"
    echo "该用户的GID: $(cat /etc/passwd |awk -F: '$1~/^'$A'$/{print}'| awk -F : '{print $4}')"

    echo "该用户的家目录为: $(cat /etc/passwd |awk -F: '$1~/^'$A'$/{print}'|awk -F: '{print $6}')"
  
    Login=$(cat /etc/passwd | awk -F: '$1~/^'$A'$/{print}' | awk -F: '{print $7}')
    
#"$Login"：这是变量 $Login 的值，用双引号括起来，以防止其中包含空格或其他特殊字符时导致错误解释
    if [ "$Login" == "/bin/bash" ]; then
        echo "该用户有登录系统的权限！！"
        echo "------------------------------"
    elif [ "$Login" == "/sbin/nologin" ]; then
        echo "该用户没有登录系统的权限！！"
        echo "------------------------------"
    fi
fi

