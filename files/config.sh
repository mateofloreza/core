sudo ip addr add 192.168.122.157/24 dev ens3
sudo ip addr add 192.168.122.158/24 dev ens3
sudo ip addr add 192.168.122.161/24 dev ens3
# sudo echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf
# sudo sysctl -p
sudo ip addr add 192.168.122.160/24 dev ens3
sudo ip addr add 192.168.122.168/24 dev ens3
sudo ip addr add 192.168.122.170/24 dev ens3
sudo ip tuntap add name ogstun mode tun
sudo ip addr add 10.45.0.1/16 dev ogstun
sudo ip link set ogstun up
sudo ip tuntap add name ogstun2 mode tun
sudo ip addr add 10.46.0.1/16 dev ogstun2
sudo ip link set ogstun2 up
sudo iptables -t nat -A POSTROUTING -s 10.45.0.0/16 ! -o ogstun -j MASQUERADE
sudo iptables -t nat -A POSTROUTING -s 10.46.0.0/16 ! -o ogstun2 -j MASQUERADE