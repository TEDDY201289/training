### Install SessionManager Plugin on your laptop
```
https://docs.aws.amazon.com/systems-manager/latest/userguide/install-plugin-macos-overview.html
```
```
curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/mac_arm64/session-manager-plugin.pkg" -o "session-manager-plugin.pkg"
```
```
sudo installer -pkg session-manager-plugin.pkg -target /

sudo ln -s /usr/local/sessionmanagerplugin/bin/session-manager-plugin /usr/local/bin/session-manager-plugin
```
```
rm -rf session-manager-plugin.pkg 
```

### Terraform Outputs
```
Outputs:

instance_ids = {
  "instance01" = "i-0dc8645c2ba4013ac"
  "instance02" = "i-039a8df4d71a26720"
  "instance03" = "i-063151766d16a25c1"
}
session_manager_commands = {
  "instance01" = "aws ssm start-session --target i-0dc8645c2ba4013ac"
  "instance02" = "aws ssm start-session --target i-039a8df4d71a26720"
  "instance03" = "aws ssm start-session --target i-063151766d16a25c1"
}
session_manager_role_arn = "arn:aws:iam::xxxxxxxxxxxx:role/frontend-session-manager-role"
vpc_endpoints = {
  "ec2_messages" = "vpce-064833fed7c58f7ba"
  "ssm" = "vpce-08e90114db5c3d06b"
  "ssm_messages" = "vpce-0988a2e3115b3a49b"
}
```

## To Connect to your private EC2 instances
### To connect to private instance 01
```
$ aws ssm start-session --target i-0dc8645c2ba4013ac

Starting session with SessionId: sai@hellocloud.io-7u95alc4od36lkd9hi7rk4xku4
$ ip addr
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host noprefixroute 
       valid_lft forever preferred_lft forever
2: enX0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 9001 qdisc fq_codel state UP group default qlen 1000
    link/ether 02:80:94:4d:b5:01 brd ff:ff:ff:ff:ff:ff
    inet 10.0.253.25/24 metric 100 brd 10.0.253.255 scope global dynamic enX0
       valid_lft 2616sec preferred_lft 2616sec
    inet6 fe80::80:94ff:fe4d:b501/64 scope link 
       valid_lft forever preferred_lft forever
$ hostname
ip-10-0-253-25
```
### To connect to private instance 02
```
$ aws ssm start-session --target i-039a8df4d71a26720

Starting session with SessionId: sai@hellocloud.io-6fenrzlcba4qvag3ecg9gnipxi
$ 
$ 
$ ip addr
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host noprefixroute 
       valid_lft forever preferred_lft forever
2: enX0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 9001 qdisc fq_codel state UP group default qlen 1000
    link/ether 06:09:dc:b6:8b:27 brd ff:ff:ff:ff:ff:ff
    inet 10.0.254.248/24 metric 100 brd 10.0.254.255 scope global dynamic enX0
       valid_lft 2494sec preferred_lft 2494sec
    inet6 fe80::409:dcff:feb6:8b27/64 scope link 
       valid_lft forever preferred_lft forever
```