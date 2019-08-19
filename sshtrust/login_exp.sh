#!/usr/bin/expect
# login_exp <password> ssh <anything>
# login_exp <password> scp <anysrc> <anydst>
set timeout 20

set cmd [lrange $argv 1 end]
set password [lindex $argv 0]

eval spawn $cmd
expect "assword:"
send "$password\r";
interact