#!/bin/bash
rm -rf ctrl
rm -rf ctrl_dir
git clone https://github.com/joq62/ctrl.git
cd ctrl
tar -zxf release/ctrl.tar.gz -C ctrl_dir
./ctrl_dir/bin/ctrl foreground
echo "$!" > /run/sys_boot.pid
