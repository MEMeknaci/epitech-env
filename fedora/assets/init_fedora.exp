#!/usr/bin/expect -f

set force_conservative 0  ;# set to 1 to force conservative mode even if
			  ;# script wasn't run conservatively originally
if {$force_conservative} {
	set send_slow {1 .1}
	proc send {ignore arg} {
		sleep .1
		exp_send -s -- $arg
	}
}

set timeout -1
spawn docker run --name fedora -i -d -v ~/.ssh:/root/.ssh -v /home/mmeknaci:/root/current -w /root epitechcontent/epitest-docker:latest
match_max 100000
sleep 0.8
send -- "exit\r"
expect eof
