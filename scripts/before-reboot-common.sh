#!/bin/bash

sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab
sed -i '11iGRUB_CMDLINE_LINUX="cgroup_enable=memory swapaccount=1"' /etc/default/grub
update-grub
