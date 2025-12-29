# dec/29/2025 14:35:09 by RouterOS 6.49.10
# software id = E1D7-88ID
#
# model = RB941-2nD
# serial number = HFE093NCTW5
/interface bridge add name=loopback
/interface wireless set [ find default-name=wlan1 ] ssid=MikroTik
/interface ethernet set [ find default-name=ether1 ] comment=UPLINK
/interface ethernet set [ find default-name=ether2 ] comment=R2
/interface wireless security-profiles set [ find default=yes ] supplicant-identity=MikroTik
/ip pool add name=dhcp_pool0 ranges=192.168.88.2-192.168.88.254
/ip pool add name=dhcp_pool1 ranges=172.16.88.2-172.16.88.254
/ip pool add name=dhcp_pool2 ranges=10.60.42.6
/ip pool add name=dhcp_pool3 ranges=192.168.10.2-192.168.10.254
/ip dhcp-server add address-pool=dhcp_pool3 disabled=no interface=ether4 name=dhcp1
/routing ospf instance set [ find default=yes ] router-id=1.1.1.1
/interface l2tp-server server set enabled=yes
/interface pptp-server server set enabled=yes
/ip address add address=10.10.10.100/24 comment=UPLINK interface=ether1 network=10.10.10.0
/ip address add address=192.168.10.1/24 interface=ether4 network=192.168.10.0
/ip address add address=10.0.0.1/30 comment=R2 interface=ether2 network=10.0.0.0
/ip address add address=1.1.1.1 comment=IP-LOOPBACK interface=loopback network=1.1.1.1
/ip dhcp-client add interface=ether1
/ip dhcp-server network add address=10.60.42.4/30 gateway=10.60.42.5
/ip dhcp-server network add address=172.16.88.0/24 gateway=172.16.88.1
/ip dhcp-server network add address=192.168.10.0/24 gateway=192.168.10.1
/ip dhcp-server network add address=192.168.88.0/24 gateway=192.168.88.1
/ip dns set allow-remote-requests=yes servers=10.10.10.1
/ip firewall address-list add address=192.168.88.1-192.168.88.254 list=lokal
/ip firewall nat add action=src-nat chain=srcnat out-interface=ether1 to-addresses=10.10.10.100
/ip route add distance=1 gateway=10.10.10.1
/ip service set telnet disabled=yes
/ip service set ftp disabled=yes
/ip service set www port=8000
/ip service set ssh disabled=yes
/ip service set api disabled=yes
/ip service set winbox port=3000
/ip service set api-ssl disabled=yes
/ppp secret add comment="Router B" local-address=10.10.1.1 name=Cipayung password=officejkt remote-address=10.10.1.2 service=pptp
/ppp secret add comment="Router C" local-address=10.10.10.1 name=Cibinong password=officejkt remote-address=10.10.10.2 service=pptp
/routing ospf network add area=backbone network=192.168.10.0/24
/routing ospf network add area=backbone network=10.0.0.0/30
/routing ospf network add area=backbone network=10.10.10.0/24
/routing ospf network add area=backbone
/system clock set time-zone-name=Asia/Jakarta
/system identity set name=Router-A
