# dec/29/2025 14:30:04 by RouterOS 6.49.19
# software id = T7DU-H7Q9
#
#
#
/interface bridge add name=loopback
/interface ethernet set [ find default-name=ether1 ] comment=UPLINK
/interface ethernet set [ find default-name=ether2 ] comment=LAN
/interface pptp-client add comment="PPTP to SITE A" connect-to=10.10.10.100 disabled=no name=pptp-officejkt password=officejkt user=Cibinong
/interface wireless security-profiles set [ find default=yes ] supplicant-identity=MikroTik
/ip pool add name=dhcp_pool0 ranges=172.16.10.2-172.16.10.126
/ip dhcp-server add address-pool=dhcp_pool0 disabled=no interface=ether2 name=dhcp1
/lora servers add address=eu.mikrotik.thethings.industries down-port=1700 name=TTN-EU up-port=1700
/lora servers add address=us.mikrotik.thethings.industries down-port=1700 name=TTN-US up-port=1700
/lora servers add address=eu1.cloud.thethings.industries down-port=1700 name="TTS Cloud (eu1)" up-port=1700
/lora servers add address=nam1.cloud.thethings.industries down-port=1700 name="TTS Cloud (nam1)" up-port=1700
/lora servers add address=au1.cloud.thethings.industries down-port=1700 name="TTS Cloud (au1)" up-port=1700
/lora servers add address=eu1.cloud.thethings.network down-port=1700 name="TTN V3 (eu1)" up-port=1700
/lora servers add address=nam1.cloud.thethings.network down-port=1700 name="TTN V3 (nam1)" up-port=1700
/lora servers add address=au1.cloud.thethings.network down-port=1700 name="TTN V3 (au1)" up-port=1700
/routing ospf instance set [ find default=yes ] router-id=1.1.1.3
/tool user-manager customer set admin access=own-routers,own-users,own-profiles,own-limits,config-payment-gw
/interface pptp-server server set enabled=yes
/ip address add address=1.1.1.3 interface=loopback network=1.1.1.3
/ip address add address=172.16.10.1/25 interface=ether2 network=172.16.10.0
/ip cloud set update-time=no
/ip dhcp-client add disabled=no interface=ether1
/ip dhcp-server network add address=172.16.10.0/25 gateway=172.16.10.1
/ip firewall nat add action=masquerade chain=srcnat out-interface=ether1
/routing ospf network add area=backbone network=172.16.10.0/32
/system lcd set contrast=0 enabled=no port=parallel type=24x4
/system lcd page set time disabled=yes display-time=5s
/system lcd page set resources disabled=yes display-time=5s
/system lcd page set uptime disabled=yes display-time=5s
/system lcd page set packets disabled=yes display-time=5s
/system lcd page set bits disabled=yes display-time=5s
/system lcd page set version disabled=yes display-time=5s
/system lcd page set identity disabled=yes display-time=5s
/system lcd page set pptp-officejkt disabled=yes display-time=5s
/system lcd page set loopback disabled=yes display-time=5s
/system lcd page set ether1 disabled=yes display-time=5s
/system lcd page set ether2 disabled=yes display-time=5s
/system lcd page set ether3 disabled=yes display-time=5s
/system lcd page set ether4 disabled=yes display-time=5s
/tool user-manager database set db-path=user-manager
