# dec/29/2025 14:40:21 by RouterOS 6.49.16
# software id = DV7W-BDSA
#
# model = RB941-2nD
# serial number = HGX0ACHCFSH
/interface bridge add name=loopback
/interface wireless set [ find default-name=wlan1 ] ssid=MikroTik
/interface ethernet set [ find default-name=ether2 ] comment=R1
/interface pptp-client add comment="PPTP to SITE A" connect-to=10.10.10.100 disabled=no name=pptp-officejkt password=officejkt user=Cipayung
/interface wireless security-profiles set [ find default=yes ] supplicant-identity=MikroTik
/ip pool add name=dhcp_pool0 ranges=192.168.20.2-192.168.20.254
/ip dhcp-server add address-pool=dhcp_pool0 disabled=no interface=ether3 name=dhcp1
/queue tree add name=animexin packet-mark=animexin_packet parent=global priority=1
/routing ospf instance set [ find default=yes ] router-id=1.1.1.2
/interface pptp-server server set enabled=yes
/ip address add address=10.0.0.2/30 comment=UPLINK interface=ether2 network=10.0.0.0
/ip address add address=192.168.20.1/24 interface=ether3 network=192.168.20.0
/ip address add address=1.1.1.2 comment=IP-LOOPBACK interface=loopback network=1.1.1.2
/ip dhcp-server network add address=192.168.20.0/24 gateway=192.168.20.1
/ip dns set allow-remote-requests=yes servers=8.8.8.8
/ip firewall address-list add address=animexin.dev list=animexin
/ip firewall filter add action=fasttrack-connection chain=input
/ip firewall mangle add action=mark-connection chain=prerouting dst-address-list=animexin new-connection-mark=animexin_conn passthrough=yes
/ip firewall mangle add action=mark-packet chain=prerouting connection-mark=animexin_conn new-packet-mark=animexin_packet passthrough=yes
/ip firewall nat add action=masquerade chain=srcnat out-interface=ether2 to-addresses=10.0.0.1
/ip route add distance=1 gateway=10.0.0.1
/ip service set telnet disabled=yes
/ip service set ftp disabled=yes
/ip service set www port=8100
/ip service set ssh disabled=yes
/ip service set api disabled=yes
/ip service set winbox port=3100
/ip service set api-ssl disabled=yes
/routing ospf network add area=backbone network=10.0.0.0/30
/routing ospf network add area=backbone network=192.168.20.0/24
/routing ospf network add area=backbone
/system clock set time-zone-name=Asia/Jakarta
/system identity set name=Router-B
