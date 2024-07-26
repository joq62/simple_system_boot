all:
	rm -rf  *~ */*~ ctrl_dir ctrl sys_boot.sh;
	git clone https://github.com/joq62/simple_system_boot.git;
	cp simple_system_boot/sys_boot.sh .
	echo Done;
ctrl:
	rm -rf ctrl
	rm -rf ctrl_dir
	git clone https://github.com/joq62/ctrl.git
	mkdir ctrl_dir
	tar -zxf ctrl/release/ctrl.tar.gz -C ctrl_dir
	sudo rm -r ctrl
test:
	cd /home/ubuntu;
	rm -rf erl_cra* rebar3_crashreport 
	rm -rf *~ */*~ */*/*~ */*/*/*~
	rm -rf ctrl ctrl_dir;
	git clone https://github.com/joq62/ctrl.git
	cd /home/ubuntu/simple_system_boot/ctrl;
	rebar3 compile;
	rebar3 release;
	rebar3 as prod tar;
	mkdir release;
	cp _build/prod/rel/ctrl/*.tar.gz release/ctrl.tar.gz;
	mkdir ctrl_dir;
	tar -zxf release/ctrl.tar.gz -C ctrl_dir;
	rm -r ctrl;
	./ctrl_dir/bin/ctrl foreground
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
