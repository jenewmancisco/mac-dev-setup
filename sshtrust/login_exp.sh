#!/usr/bin/expect
# login_exp <password> ssh <anything>
# login_exp <password> scp <anysrc> <anydst>
set timeout 40

set cmd [lrange $argv 1 end]
set password [lindex $argv 0]

eval spawn $cmd
expect {
    -re "assword:" {
        send "$password\n"; exp_continue}
        ".*Are you sure you want to continue connecting.*" {
        send "yes\n"; exp_continue }
    eof
}
interact
