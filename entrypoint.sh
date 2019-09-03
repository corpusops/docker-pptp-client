#!/usr/bin/env bash
set -e
if [[ -n ${DEBUG-} ]];then set -x;fi
cd /host/rootfs
while read t;do
    o=${t//.dist/}
    f=$t
    if [ -e /host/$o ];then f=$o;fi
    frep /host/rootfs/$f:/$o --overwrite
done < <(find * -type f)
cd -
chmod -vf 600 /etc/ppp/*secrets
# modprobe nf_conntrack_pptp

sysctl -w net.ipv4.ip_forward=1 || /bin/true
# configure firewall
iptables -A INPUT -i ppp0 -j ACCEPT
iptables -A OUTPUT -o ppp0 -j ACCEPT
iptables -A FORWARD -i ppp0 -j ACCEPT
iptables -A FORWARD -o ppp0 -j ACCEPT

# exec bash
exec pon ${PROVIDER:-peer}
# vim:set et sts=4 ts=4 tw=80:
