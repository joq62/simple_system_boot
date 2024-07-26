#!/bin/bash
rm -rf ctrl
rm -rf ctrl_dir
git clone https://github.com/joq62/ctrl.git
mkdir ctrl_dir
tar -zxf ctrl/release/ctrl.tar.gz -C ctrl_dir
sudo rm -r ctrl
./ctrl_dir/bin/ctrl foreground
sudo echo "$!" > /run/sys_boot.pid
