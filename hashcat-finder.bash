#!/bin/bash
echo '输入md5(小写):'

read md5
#echo $md5
#rm ~/.local/share/hashcat/hashcat.potfile

echo "" > result.txt
echo "" > temp.txt

# 先用 --show 来读 potfile 中已存在的。
hashcat -m 0 -a 3 $md5 '0@qq.com' -o temp.txt -O --show
cat temp.txt >> result.txt

hashcat -m 0 -a 3 $md5 '?1?d?d?d?d?d?d?d?d?d@qq.com' -o temp.txt -O --custom-charset1 1234
cat temp.txt >> result.txt
hashcat -m 0 -a 3 $md5 '?1?d?d?d?d?d?d?d?d@qq.com' -o temp.txt -O --custom-charset1 123456789
cat temp.txt >> result.txt
hashcat -m 0 -a 3 $md5 '?1?d?d?d?d?d?d?d@qq.com' -o temp.txt -O --custom-charset1 123456789
cat temp.txt >> result.txt
hashcat -m 0 -a 3 $md5 '?1?d?d?d?d?d?d@qq.com' -o temp.txt -O --custom-charset1 123456789
cat temp.txt >> result.txt
hashcat -m 0 -a 3 $md5 '?1?d?d?d?d?d@qq.com' -o temp.txt -O --custom-charset1 123456789
cat temp.txt >> result.txt
hashcat -m 0 -a 3 $md5 '?1?d?d?d?d@qq.com' -o temp.txt -O --custom-charset1 123456789
cat temp.txt >> result.txt
hashcat -m 0 -a 3 $md5 '?1?d?d?d@qq.com' -o temp.txt -O --custom-charset1 123456789
cat temp.txt >> result.txt
hashcat -m 0 -a 3 $md5 '?1?d?d@qq.com' -o temp.txt -O --custom-charset1 123456789
cat temp.txt >> result.txt
hashcat -m 0 -a 3 $md5 '?1?d@qq.com' -o temp.txt -O --custom-charset1 123456789
cat temp.txt >> result.txt
hashcat -m 0 -a 3 $md5 '?d@qq.com' -o temp.txt -O --custom-charset1 123456789
cat temp.txt >> result.txt

rm temp.txt
echo "=== result ==="
sort result.txt|uniq
