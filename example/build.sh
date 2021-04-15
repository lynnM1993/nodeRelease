#!/usr/bin/expect -f
#set timeout 3
set userName "root"
set packageIp "127.0.0.1"
set pwd "123456"
set htmlPath "/usr/local/openresty/nginx/html/backBuild"
spawn scp -oUserKnownHostsFile=/dev/null -oStrictHostKeyChecking=ask build.zip  ${userName}@${packageIp}:~/

expect "Are you sure you want to continue connecting*" {
 send "yes\r"
}


expect "*password:*" {
    send "${pwd}\r;"
}
expect "${userName}@${packageIp}'s password:*" {
    send "${pwd}\r;"
}

sleep 15
spawn ssh -o StrictHostKeyChecking=ask ${userName}@${packageIp}  "sudo sh ${htmlPath}/zip.sh"

expect "*password:*" {
    send "${pwd}\r;"
}
expect "${userName}@${packageIp}'s password:*" {
    send "${pwd}\r;"
}