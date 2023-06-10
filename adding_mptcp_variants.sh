#!/bin/bash

#lia
sudo modprobe -v mptcp_coupled
#sudo insmod  /lib/modules/$(uname -r)/kernel/net/mptcp/mptcp_coupled.ko

#olia
sudo modprobe -v mptcp_olia
#sudo insmod  /lib/modules/$(uname -r)/kernel/net/mptcp/mptcp_olia.ko


#balia
sudo modprobe -v mptcp_balia
#sudo insmod  /lib/modules/$(uname -r)/kernel/net/mptcp/mptcp_balia.ko

#wvegas
sudo modprobe -v mptcp_wvegas
#sudo insmod  /lib/modules/$(uname -r)/kernel/net/mptcp/mptcp_wvegas.ko

#binder
sudo modprobe -v mptcp_binder
#sudo insmod  /lib/modules/$(uname -r)/kernel/net/mptcp/mptcp_binder.ko

#blest
sudo modprobe -v mptcp_blest
#sudo insmod  /lib/modules/$(uname -r)/kernel/net/mptcp/mptcp_blest.ko

#ECF
sudo modprobe -v mptcp_ecf
#sudo insmod  /lib/modules/$(uname -r)/kernel/net/mptcp/mptcp_ecf.ko

#ndiffports
sudo modprobe -v mptcp_ndiffports
#sudo insmod  /lib/modules/$(uname -r)/kernel/net/mptcp/mptcp_ecf.ko

#netlink
sudo modprobe -v mptcp_netlink
#sudo insmod  /lib/modules/$(uname -r)/kernel/net/mptcp/mptcp_netlink.ko

#redundant
sudo modprobe -v mptcp_redundant
#sudo insmod  /lib/modules/$(uname -r)/kernel/net/mptcp/mptcp_redundant.ko

#roundrobin
sudo modprobe -v mptcp_rr
#sudo insmod  /lib/modules/$(uname -r)/kernel/net/mptcp/mptcp_rr.ko








