all:
	rm -rf  *~ */*~ ctrl_dir ctrl;
	git clone https://github.com/joq62/system_boot.git;
	echo Done;
test:
	cd /home/ubuntu;
	rm -rf erl_cra* rebar3_crashreport 
	rm -rf *~ */*~ */*/*~ */*/*/*~
	rm -rf ctrl
	git clone https://github.com/joq62/ctrl.git
	cd /home/ubuntu/simple_system_boot/ctrl;
	rebar3 compile;
	rebar3 release;
	./_build/default/rel/ctrl/bin/ctrl foreground
start_daemon:
	cd /home/ubuntu;
	rm -rf erl_cra* rebar3_crashreport 
	rm -rf *~ */*~ */*/*~ */*/*/*~
	rm -rf ctrl
	git clone https://github.com/joq62/ctrl.git
	cd /home/ubuntu/simple_system_boot/ctrl;
	rebar3 compile;
	rebar3 release;
	./_build/default/rel/ctrl/bin/ctrl daemon
