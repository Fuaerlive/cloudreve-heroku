#!/bin/sh

cat <<-EOF > /root/cloudreve/mycloudreve.ini
[System]
; 运行模式
Mode = master
; 监听端口
Listen = :${PORT}
; 是否开启 Debug
Debug = false
; Session 密钥, 一般在首次启动时自动生成
; 5201314的md5加密密文为723d505516e0c197e42a6be3c0af910e
; 搭配cloudreve.db 默认关闭注册 管理员为 admin@cloudreve.org / cloudreve@2020
SessionSecret = 723d505516e0c197e42a6be3c0af910e
; Hash 加盐, 一般在首次启动时自动生成
HashIDSalt = 723d505516e0c197e42a6be3c0af910e
[Database]
; 数据库类型，目前支持 sqlite | mysql
Type = $DB_Type
; 数据库地址
Host = $DB_Host
; MySQL 端口
Port = $DB_Port
; 用户名
User = $DB_User
; 密码
Password = $DB_Password
; 数据库名称
Name = $DB_Name
; 数据表前缀
TablePrefix = V3
EOF
mkdir /lib64
ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2
/root/cloudreve/cloudreve -c /root/cloudreve/mycloudreve.ini
