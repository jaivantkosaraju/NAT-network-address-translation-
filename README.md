# NAT-network-address-translation-
This project demonstrates the creation of a virtual network topology using Linux namespaces, veth pairs, and iptables to simulate a private LAN, NAT-enabled router, and an external simulated public network. Additionally, it sets up port forwarding to allow access to an internal web server from the internet.
In this project i created a a network which displays the following topology.
Client (192.168.10.2)  <-------->  Router (NAT)  <--------> Simulated Internet (203.0.113.2)
                         192.168.10.1               203.0.113.1
                          (veth1)                     (veth2)
I created a separate namespace for the internet as well.
This is the reason why the traceroute to any other ip address other than 203.0.113.2 will only show one jump and then terminate as it wont recognize the ip address.
NAT (Network Address Translation): Allows the private LAN to access the simulated public network through the router.
The commands were used to create namespaces for client,router and the internet.
192.168.10.2 is a private ip address whereas 203.0.113.1 is a public ip address.
Thus,this shows NAT perfectly.
                          
