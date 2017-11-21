#!/usr/bin/expect -f
# vars
set timeout -1
set NEO_CLI_HOME [lindex $argv 0]
set PASSWORD "test"
# run neo
cd $NEO_CLI_HOME
spawn dotnet neo-cli.dll /rpc
# interact
expect "neo>"
send "open wallet wallet.db3\n"
expect "password:"
send "$PASSWORD\n"
expect "neo>"
send "start consensus\n"
expect "OnStart"
interact
