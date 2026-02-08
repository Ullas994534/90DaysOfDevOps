Day 15 – Networking Concepts: DNS, IP, Subnets & Ports
Task

Build on Day 14 by understanding the building blocks of networking every DevOps engineer must know.

You will:

Understand how DNS resolves names to IPs

Learn IP addressing (IPv4, public vs private)

Break down CIDR notation and subnetting basics

Know common ports and why they matter

This is concept-focused — research, understand, and document in your own words.

Challenge Tasks
1) What happens when you type google.com in a browser? (3–4 lines)

When you type google.com, DNS resolves the domain name into an IP address. A TCP three-way handshake is established between your machine and Google’s server, followed by an HTTPS session setup. The HTTP request then travels through gateways, routers, switches, and ISPs to reach Google’s servers, which process the request and send back a response.

2) DNS Record Types (one line each)

A (Address): Maps a hostname to an IPv4 address.

AAAA (IPv6 Address): Maps a hostname to an IPv6 address.

CNAME (Canonical Name): Maps an alias or subdomain to another domain name.

MX (Mail Exchange): Specifies mail servers responsible for receiving email for a domain.

NS (Name Server): Defines the authoritative name servers for a domain.

3) dig google.com — Identify A record & TTL

Using dig google.com shows the A records (IPv4 addresses) returned by Google along with their TTL (Time To Live). TTL defines how long DNS resolvers can cache the response before querying again.

Task 2: IP Addressing
1) What is an IPv4 address? How is it structured?

IPv4 (Internet Protocol version 4) is used to uniquely identify devices on a network. It is a 32-bit address divided into four 8-bit octets, written in dotted-decimal format (e.g., 192.168.1.10), where each octet ranges from 0–255.

2) Public vs Private IP Addresses
Private IP Address	Public IP Address
Used inside local networks	Used on the internet
Not routable publicly	Routable globally
Assigned by router/DHCP	Assigned by ISP
Example: 192.168.1.10	Example: 203.0.113.10
3) Private IP Ranges

10.0.0.0/8 → 10.0.0.0 – 10.255.255.255

172.16.0.0/12 → 172.16.0.0 – 172.31.255.255

192.168.0.0/16 → 192.168.0.0 – 192.168.255.255

4) Identify Private IPs (ip addr show)

From the output:

192.168.1.13 → Private IP (Wi-Fi interface)

Extra context:

127.0.0.1 → Loopback (localhost)

172.17.0.1 → Docker bridge network

101.0.62.104 → Public IP (from curl ifconfig.me)

Task 3: CIDR & Subnetting
1) What does /24 mean in 192.168.1.0/24?

The /24 indicates that the first 24 bits are used for the network portion, leaving 8 bits for host addresses.

2) Usable Hosts

/24 → 254 usable hosts

/16 → 65,534 usable hosts

/28 → 14 usable hosts

3) Why do we subnet?

Subnetting divides a large network into smaller, efficient networks. It reduces broadcast traffic, improves performance, enhances security, and makes IP management easier.

4) CIDR Reference Table
CIDR	Subnet Mask	Total IPs	Usable Hosts
/24	255.255.255.0	256	254
/16	255.255.0.0	65,536	65,534
/28	255.255.255.240	16	14
Task 4: Ports – The Doors to Services
1) What is a port?

A port is a logical endpoint used to identify specific services on a system. Ports allow multiple applications to communicate over the network simultaneously.

2) Common Ports
Port	Service
22	SSH
80	HTTP
443	HTTPS
53	DNS
3306	MySQL
6379	Redis
27017	MongoDB
3) Listening Ports (ss -tulpn)

Using ss -tulpn, active listening services can be mapped to their respective ports and processes.

Putting It Together
1) curl http://myapp.com:8080

This involves DNS resolution, establishing a TCP connection to port 8080, and sending an HTTP request. Routing, firewalls, and the TCP/IP stack work together to return the response.

2) App can’t reach DB at 10.0.1.50:3306

Check network reachability (ping, traceroute), verify firewall/security group rules for port 3306, and ensure the database service is running and listening.

Summary

Learned how DNS resolves domain names to IPs and how IPv4 addressing works.

Understood public vs private IPs and common private ranges.

Explored CIDR, subnetting, and host calculations.

Studied ports and their role in exposing services.

Practiced real-world troubleshooting using dig, ip addr, ss, and curl, connecting networking theory to DevOps workflows.
