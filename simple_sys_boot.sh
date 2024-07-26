#!/bin/bash
cd /home/ubuntu
rm -rf erl_cra* rebar3_crashreport 
rm -rf *~ */*~ */*/*~ */*/*/*~
rm -rf ctrl ctrl_dir;
git clone https://github.com/joq62/ctrl.git
cd ctrl
rebar3 compile;
rebar3 release;
rebar3 as prod tar;
mkdir release;
cp _build/prod/rel/ctrl/*.tar.gz release/ctrl.tar.gz;
mkdir ctrl_dir;
tar -zxf release/ctrl.tar.gz -C ctrl_dir;
./ctrl_dir/bin/ctrl foreground
