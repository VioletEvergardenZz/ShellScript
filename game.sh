#! /bin/bash
#  xiaoxiao
#  2024.4.26

echo "请输入您的姓名: "
read name
echo "您好,$name"
number=$(shuf -i 1-10 -n 1)
#echo $number
while [[ $number -ne $guess ]]
do
echo "请输入一个数字(1-10): "
read guess
if [[ $number -eq $guess ]]; then
	echo "猜对了"
elif [[ $number -gt $guess ]]; then
	echo "猜小了"
else
	echo "猜大了"
fi
done
