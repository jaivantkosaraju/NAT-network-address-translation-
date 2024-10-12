sudo ip netns del client
sudo ip netns del router
sudo ip netns del internet
sudo ip netns add client
sudo ip netns add router
sudo ip netns add internet
sudo ip link add veth-client type veth peer name veth-router1
sudo ip link add veth-router2 type veth peer name veth-internet
sudo ip link set veth-client netns client
sudo ip link set veth-router1 netns router
sudo ip link set veth-router2 netns router
sudo ip link set veth-internet netns internet
sudo ip netns exec client ip addr add 192.168.10.2/24 dev veth-client
sudo ip netns exec client ip link set dev veth-client up
sudo ip netns exec client ip route add default via 192.168.10.1
sudo ip netns exec router ip addr add 192.168.10.1/24 dev veth-router1
sudo ip netns exec router ip link set dev veth-router1 up
sudo ip netns exec router ip addr add 203.0.113.1/24 dev veth-router2
sudo ip netns exec router ip link set dev veth-router2 up
sudo ip netns exec internet ip addr add 203.0.113.2/24 dev veth-internet
sudo ip netns exec internet ip link set dev veth-internet up
sudo ip netns exec internet ip route add default via 203.0.113.1
sudo ip netns exec client ip link set lo up
sudo ip netns exec router ip link set lo up
sudo ip netns exec internet ip link set lo up
sudo ip netns exec router sysctl -w net.ipv4.ip_forward=1
sudo ip netns exec router iptables -t nat -A POSTROUTING -o veth-router2 -j MASQUERADE
sudo ip netns exec client ping -c 3 203.0.113.2
sudo ip netns exec client traceroute 203.0.113.2

