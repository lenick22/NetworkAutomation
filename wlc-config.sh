#!/bin/bash

# Assign variables to each parameter provided
LOCATION=$1
SUBNET=$2
NETWORK=$3
SITE=$4
ConfigName=$5

# Write the file the contains the plugged-in values
cat <<EOT > ~/$ConfigName
config network mgmt-via-wireless enable
config network webmode enable
config network rf-network-name $LOCATION
config network webcolor red
config network fast-ssid-change enable
config network multicast global enable
config network multicast mode multicast 239.0.0.1
config network multicast igmp snooping enable
config network multicast l2mcast disable service-port
config network multicast l2mcast disable virtual
config network ms-open port 16000
config location expiry tags 5
config 802.11b cleanair device disable ble-beacon
config 802.11b cleanair enable
config 802.11b cac voice sip bandwidth 64 sample-interval 20
config 802.11b cac voice sip codec g711 sample-interval 20
config 802.11b 11gsupport enable
config trapflags stpmode disable
config trapflags ap timesyncfailure disable
config trapflags ap ssidkeyconflict enable
config trapflags ap modechange enable
config trapflags ap roguesignal disable
config trapflags ap interfaceup enable
config trapflags ap authfailure enable
config trapflags ap register enable
config trapflags ap neighborapsignal disable
config trapflags mesh disable
config trapflags client webauthuserlogin disable
config trapflags client max-warning-threshold enable
config trapflags client 802.11-disassociate enable
config trapflags client neighborclientsignal disable
config trapflags client 802.11-deauthenticate enable
config trapflags client enhanced-authentication disable
config trapflags client enhanced-802.11-deauthenticate disable
config trapflags client authentication enable
config trapflags client enhanced-802.11-stats disable
config trapflags client enhanced-802.11-associate disable
config trapflags client excluded enable
config trapflags client 802.11-assocfail disable
config trapflags client webauthuserlogout disable
config trapflags client nac-alert enable
config trapflags client 802.11-associate enable
config trapflags client 802.11-authfail enable
config dhcp network $SITE-AP-Network 10.$SUBNET.3.0 255.255.255.0
config dhcp proxy disable bootp-broadcast disable
config dhcp address-pool $SITE-AP-Network $NETWORK
config dhcp domain $SITE-AP-Network peapod.com
config dhcp lease $SITE-AP-Network 86400
config dhcp create-scope $SITE-AP-Network
config dhcp dns-servers $SITE-AP-Network 10.4.1.13 10.4.1.14
config dhcp default-router $SITE-AP-Network 10.$SUBNET.3.1
config dhcp enable $SITE-AP-Network
config sys-nas config sys-nas $SITE-WLC01
config interface address management 10.$SUBNET.3.10 255.255.255.0 10.$SUBNET.3.1
config interface port management 1
config interface address virtual 192.0.2.1
config interface vlan podprod_mgmnt 0
config interface create podprod_mgmnt 0

config interface dhcp management primary 10.$SUBNET.1.20
config interface dhcp dynamic-interface podprod_mgmnt primary 10.$SUBNET.1.20
config time timezone location 8
config time ntp server 1 10.1.3.10
config time ntp server 2 10.1.3.194
config advanced 802.11a channel add 36
config advanced 802.11a channel add 40
config advanced 802.11a channel add 44
config advanced 802.11a channel add 48
config advanced 802.11a channel add 52
config advanced 802.11a channel add 56
config advanced 802.11a channel add 60
config advanced 802.11a channel add 64
config advanced 802.11a channel add 100
config advanced 802.11a channel add 104
config advanced 802.11a channel add 108
config advanced 802.11a channel add 112
config advanced 802.11a channel add 116
config advanced 802.11a channel add 120
config advanced 802.11a channel add 124
config advanced 802.11a channel add 128
config advanced 802.11a channel add 132
config advanced 802.11a channel add 136
config advanced 802.11a channel add 140
config advanced 802.11a channel add 144
config advanced 802.11a channel add 149
config advanced 802.11a channel add 153
config advanced 802.11a channel add 157
config advanced 802.11a channel add 161
config advanced 802.11a channel dca chan-width 40
config advanced 802.11a channel dca interval 8
config advanced 802.11a channel cleanair-event enable
config advanced probe limit 2 500
config advanced 802.11b channel add 1
config advanced 802.11b channel add 6
config advanced 802.11b channel add 11
config advanced 802.11b channel dca interval 8
config advanced 802.11b channel cleanair-event sensitivity low
config advanced 802.11b channel cleanair-event enable
config advanced fra interval 24
config mesh convergence
config remote-lan flexconnect local-switching 10 enable
config rf-profile channel add 36 High-Client-Density-802.11a
config rf-profile channel add 40 High-Client-Density-802.11a
config rf-profile channel add 44 High-Client-Density-802.11a
config rf-profile channel add 48 High-Client-Density-802.11a
config rf-profile channel add 52 High-Client-Density-802.11a
config rf-profile channel add 56 High-Client-Density-802.11a
config rf-profile channel add 60 High-Client-Density-802.11a
config rf-profile channel add 64 High-Client-Density-802.11a
config rf-profile channel add 149 High-Client-Density-802.11a
config rf-profile channel add 153 High-Client-Density-802.11a
config rf-profile channel add 157 High-Client-Density-802.11a
config rf-profile channel add 161 High-Client-Density-802.11a
config rf-profile channel chan-width 40 High-Client-Density-802.11a
config rf-profile create 802.11a High-Client-Density-802.11a
config rf-profile tx-power-control-thresh-v1 -65 High-Client-Density-802.11a
config rf-profile channel add 1 High-Client-Density-802.11bg
config rf-profile channel add 6 High-Client-Density-802.11bg
config rf-profile channel add 11 High-Client-Density-802.11bg
config rf-profile channel chan-width 20 High-Client-Density-802.11bg
config rf-profile create 802.11b High-Client-Density-802.11bg
config rf-profile channel add 36 Low-Client-Density-802.11a
config rf-profile channel add 40 Low-Client-Density-802.11a
config rf-profile channel add 44 Low-Client-Density-802.11a
config rf-profile channel add 48 Low-Client-Density-802.11a
config rf-profile channel add 52 Low-Client-Density-802.11a
config rf-profile channel add 56 Low-Client-Density-802.11a
config rf-profile channel add 60 Low-Client-Density-802.11a
config rf-profile channel add 64 Low-Client-Density-802.11a
config rf-profile channel add 149 Low-Client-Density-802.11a
config rf-profile channel add 153 Low-Client-Density-802.11a
config rf-profile channel add 157 Low-Client-Density-802.11a
config rf-profile channel add 161 Low-Client-Density-802.11a
config rf-profile channel chan-width 40 Low-Client-Density-802.11a
config rf-profile coverage voice -90 Low-Client-Density-802.11a
config rf-profile coverage exception 2 Low-Client-Density-802.11a
config rf-profile coverage data -90 Low-Client-Density-802.11a
config rf-profile create 802.11a Low-Client-Density-802.11a
config rf-profile tx-power-control-thresh-v1 -60 Low-Client-Density-802.11a
config rf-profile channel add 1 Low-Client-Density-802.11bg
config rf-profile channel add 6 Low-Client-Density-802.11bg
config rf-profile channel add 11 Low-Client-Density-802.11bg
config rf-profile channel chan-width 20 Low-Client-Density-802.11bg
config rf-profile coverage voice -90 Low-Client-Density-802.11bg
config rf-profile coverage exception 2 Low-Client-Density-802.11bg
config rf-profile coverage data -90 Low-Client-Density-802.11bg
config rf-profile create 802.11b Low-Client-Density-802.11bg
config rf-profile tx-power-control-thresh-v1 -65 Low-Client-Density-802.11bg
config rf-profile channel add 36 Typical-Client-Density-802.11a
config rf-profile channel add 40 Typical-Client-Density-802.11a
config rf-profile channel add 44 Typical-Client-Density-802.11a
config rf-profile channel add 48 Typical-Client-Density-802.11a
config rf-profile channel add 52 Typical-Client-Density-802.11a
config rf-profile channel add 56 Typical-Client-Density-802.11a
config rf-profile channel add 60 Typical-Client-Density-802.11a
config rf-profile channel add 64 Typical-Client-Density-802.11a
config rf-profile channel add 149 Typical-Client-Density-802.11a
config rf-profile channel add 153 Typical-Client-Density-802.11a
config rf-profile channel add 157 Typical-Client-Density-802.11a
config rf-profile channel add 161 Typical-Client-Density-802.11a
config rf-profile channel chan-width 40 Typical-Client-Density-802.11a
config rf-profile create 802.11a Typical-Client-Density-802.11a
config rf-profile channel add 1 Typical-Client-Density-802.11bg
config rf-profile channel add 6 Typical-Client-Density-802.11bg
config rf-profile channel add 11 Typical-Client-Density-802.11bg
config rf-profile channel chan-width 20 Typical-Client-Density-802.11bg
config rf-profile create 802.11b Typical-Client-Density-802.11bg
config rf-profile data-rates 802.11a disabled 6 High-Client-Density-802.11a
config rf-profile data-rates 802.11a disabled 9 High-Client-Density-802.11a
config rf-profile data-rates 802.11a mandatory 12 High-Client-Density-802.11a
config rf-profile data-rates 802.11a supported 18 High-Client-Density-802.11a
config rf-profile data-rates 802.11a mandatory 24 High-Client-Density-802.11a
config rf-profile data-rates 802.11a supported 36 High-Client-Density-802.11a
config rf-profile data-rates 802.11a supported 48 High-Client-Density-802.11a
config rf-profile data-rates 802.11a supported 54 High-Client-Density-802.11a
config rf-profile tx-power-min 7 High-Client-Density-802.11a
config rf-profile rx-sop threshold -78 High-Client-Density-802.11a
config rf-profile data-rates 802.11b disabled 1 High-Client-Density-802.11bg
config rf-profile data-rates 802.11b disabled 2 High-Client-Density-802.11bg
config rf-profile data-rates 802.11b disabled 5.5 High-Client-Density-802.11bg
config rf-profile data-rates 802.11b disabled 11 High-Client-Density-802.11bg
config rf-profile data-rates 802.11b disabled 6 High-Client-Density-802.11bg
config rf-profile data-rates 802.11b supported 9 High-Client-Density-802.11bg
config rf-profile data-rates 802.11b mandatory 12 High-Client-Density-802.11bg
config rf-profile data-rates 802.11b supported 18 High-Client-Density-802.11bg
config rf-profile data-rates 802.11b supported 24 High-Client-Density-802.11bg
config rf-profile data-rates 802.11b supported 36 High-Client-Density-802.11bg
config rf-profile data-rates 802.11b supported 48 High-Client-Density-802.11bg
config rf-profile data-rates 802.11b supported 54 High-Client-Density-802.11bg
config rf-profile tx-power-min 7 High-Client-Density-802.11bg
config rf-profile rx-sop threshold -82 High-Client-Density-802.11bg
config rf-profile data-rates 802.11a mandatory 6 Low-Client-Density-802.11a
config rf-profile data-rates 802.11a supported 9 Low-Client-Density-802.11a
config rf-profile data-rates 802.11a mandatory 12 Low-Client-Density-802.11a
config rf-profile data-rates 802.11a supported 18 Low-Client-Density-802.11a
config rf-profile data-rates 802.11a mandatory 24 Low-Client-Density-802.11a
config rf-profile data-rates 802.11a supported 36 Low-Client-Density-802.11a
config rf-profile data-rates 802.11a supported 48 Low-Client-Density-802.11a
config rf-profile data-rates 802.11a supported 54 Low-Client-Density-802.11a
config rf-profile rx-sop threshold -80 Low-Client-Density-802.11a
config rf-profile data-rates 802.11b mandatory 1 Low-Client-Density-802.11bg
config rf-profile data-rates 802.11b mandatory 2 Low-Client-Density-802.11bg
config rf-profile data-rates 802.11b mandatory 5.5 Low-Client-Density-802.11bg
config rf-profile data-rates 802.11b mandatory 11 Low-Client-Density-802.11bg
config rf-profile data-rates 802.11b supported 6 Low-Client-Density-802.11bg
config rf-profile data-rates 802.11b supported 9 Low-Client-Density-802.11bg
config rf-profile data-rates 802.11b supported 12 Low-Client-Density-802.11bg
config rf-profile data-rates 802.11b supported 18 Low-Client-Density-802.11bg
config rf-profile data-rates 802.11b supported 24 Low-Client-Density-802.11bg
config rf-profile data-rates 802.11b supported 36 Low-Client-Density-802.11bg
config rf-profile data-rates 802.11b supported 48 Low-Client-Density-802.11bg
config rf-profile data-rates 802.11b supported 54 Low-Client-Density-802.11bg
config rf-profile rx-sop threshold -85 Low-Client-Density-802.11bg
config rf-profile data-rates 802.11a mandatory 6 Typical-Client-Density-802.11a
config rf-profile data-rates 802.11a supported 9 Typical-Client-Density-802.11a
config rf-profile data-rates 802.11a mandatory 12 Typical-Client-Density-802.11a
config rf-profile data-rates 802.11a supported 18 Typical-Client-Density-802.11a
config rf-profile data-rates 802.11a mandatory 24 Typical-Client-Density-802.11a
config rf-profile data-rates 802.11a supported 36 Typical-Client-Density-802.11a
config rf-profile data-rates 802.11a supported 48 Typical-Client-Density-802.11a
config rf-profile data-rates 802.11a supported 54 Typical-Client-Density-802.11a
config rf-profile data-rates 802.11b disabled 1 Typical-Client-Density-802.11bg
config rf-profile data-rates 802.11b disabled 2 Typical-Client-Density-802.11bg
config rf-profile data-rates 802.11b disabled 5.5 Typical-Client-Density-802.11bg
config rf-profile data-rates 802.11b disabled 11 Typical-Client-Density-802.11bg
config rf-profile data-rates 802.11b disabled 6 Typical-Client-Density-802.11bg
config rf-profile data-rates 802.11b supported 9 Typical-Client-Density-802.11bg
config rf-profile data-rates 802.11b mandatory 12 Typical-Client-Density-802.11bg
config rf-profile data-rates 802.11b supported 18 Typical-Client-Density-802.11bg
config rf-profile data-rates 802.11b supported 24 Typical-Client-Density-802.11bg
config rf-profile data-rates 802.11b supported 36 Typical-Client-Density-802.11bg
config rf-profile data-rates 802.11b supported 48 Typical-Client-Density-802.11bg
config rf-profile data-rates 802.11b supported 54 Typical-Client-Density-802.11bg
config mobility group domain $LOCATION
config logging buffered notifications
config logging buffered 5
config logging syslog level debugging
config logging syslog level 7
config logging traceinfo disable debugging
config sessions timeout 160
config countries-list add US
config radius callstationidtype ipaddr
config radius acct add encrypt 1 10.215.215.125 1813 password 1 74c5e7c5e20bbb69ca73386dbb906272 06fc43b0604b090915f5ce90733d81c2fb20fa77 16 01781e3834265f52a5e63e96fb2aaa9f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
config radius acct network 1 enable
config radius acct retransmit-timeout 1 2
config radius acct add encrypt 2 10.46.211.125 1813 password 1 2073395da8ee441487a33a8d7f31fc20 a696a2305766d5b41f84127d45ac2a4bc7d93154 16 1ab05fd7dc3c5717134b553bc885e5c500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
config radius acct network 2 enable
config radius acct retransmit-timeout 2 2
config radius acct add encrypt 3 10.215.215.27 1813 password 1 a7f4ea044cab522643293ad61ab55d0a adb736d7a4cefaaf42dc9fdcd4d466db3e7ab36b 16 524d2d74a06dfd1417519e8ea437db0300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
config radius acct network 3 enable
config radius acct retransmit-timeout 3 2
config radius acct enable 1
config radius acct enable 2
config radius acct enable 3
config radius auth add encrypt 1 10.215.215.25 1812 password 1 384dd9baeafc833bd0ad77e55613f62c eabbdedb616bcf4e96681885f90a86065aa9ced2 16 902fa209aa37e3297ea94549ffe5ec6e00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
config radius auth network 1 enable
config radius auth add encrypt 2 10.215.215.26 1812 password 1 205c856fe112738a1d6491308bc532a2 1cce5096fb5b14991b44e38c58bbe1fc32efc234 16 506e50795ecd97b94175a9cf49df3f1f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
config radius auth network 2 enable
config radius auth add encrypt 3 10.215.215.125 1812 password 1 b39e2bedc0fe816f3cbb677b350ce472 264e9ec2b741dcbc67e2524484b02f0989eb6171 16 8e57640f81d9419d4aa7d9ceecfe8d4d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
config radius auth rfc3576 enable 3
config radius auth network 3 enable
config radius auth add encrypt 4 10.46.211.125 1812 password 1 7c85df4322baa8fa55f9918c1f18f20b eec2ae5aafaaeb48f1ecd6792b2fcc5018a82391 16 56971653503175abcedd8740fd96810800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
config radius auth rfc3576 enable 4
config radius auth network 4 enable
config radius auth add encrypt 5 10.215.215.25 1645 password 1 c2d94da93e46bac5d6f84a3e3b0a74ef 75dedfaece29de392b4074d5f9f78f3482c35c0e 16 c9a00a8ffc1ebbdf7468b2ab5b783c2600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
config radius auth network 5 enable
config radius auth add encrypt 6 10.215.215.27 1812 password 1 c395fcbcf77e08c974344373dafbe95e 71b40dfd8125a4116de8e44869d63448a72314a3 16 ebafb3ec42539e4a490689fc57b46bfc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
config radius auth network 6 enable
config radius auth retransmit-timeout 1 2
config radius auth retransmit-timeout 2 2
config radius auth retransmit-timeout 3 2
config radius auth retransmit-timeout 4 2
config radius auth retransmit-timeout 5 2
config radius auth retransmit-timeout 6 2
config radius auth callstationidtype ap-name-ssid
config radius auth management 3 enable
config radius auth management 4 enable
config radius auth management 5 enable
config radius auth management 6 enable
config radius auth enable 1
config radius auth enable 2
config radius auth enable 3
config radius auth enable 4
config radius auth enable 5
config radius auth enable 6
config 802.11a cleanair enable
config 802.11a cac voice sip bandwidth 64 sample-interval 20
config 802.11a cac voice sip codec g711 sample-interval 20
config auth-list add mic 54:a2:74:a6:8a:5a
config auth-list add mic 80:e0:1d:80:dd:49
config nmsp notification interval rssi rfid 2
config ap mgmtuser add encrypt username admin password 1 5453ed62e840aff22efd27ba454780bd 38767ae940b460caf744fda76af1545a34c88bf8 16 f286b56a8a46eef9d3dac4a213af92320000000000000000000000000000000000000000000000000000000000000000 24312437327a77244b53696f4973426563543648725966654b363832672f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 secret encrypt 24312465304f4a243544594d61392f534d6b4972697a414b504c6e4b4c2f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 all
config ap packet-dump buffer-size 2048
config ap packet-dump capture-time 10
config ap packet-dump truncate 0
config ap tcp-adjust-mss enable all 1363
config ap preferred-mode ipv4 all
config ap bhrate 0 all
config ap ssh enable all
config ap ssh enable all
config mgmtuser add encrypt admin 1 aaa82ef95af8acc610f7c53fb6902bb1 9235696d03f744f65e1c27609abff5f76d049da2 16 ceab822b3c10d383fb8c8ed3bbe423c90000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 read-write
config mgmtuser telnet admin enable
config mgmtuser add encrypt rbeasley 1 8619ec2a78e2c6267b28ebbf9c78000e 473d3cbb3330579e5035961523de502b6453caca 16 7afafb3f4b98052127d32101fb2c138c0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 read-write
config mgmtuser telnet rbeasley enable
config mgmtuser add encrypt kangerer 1 0a89ac6f51308739cc6f41db5beeec69 de91708763893d969e9eeeadae50c8cbbb3091e4 16 bf7b80a7c4f47d788e57404ac9015a8e0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 read-write
config mgmtuser telnet kangerer enable
config msglog level warning
config mdns profile service add default-mdns-profile AirPrint
config mdns profile service add default-mdns-profile AirTunes
config mdns profile service add default-mdns-profile AppleTV
config mdns profile service add default-mdns-profile HP_Photosmart_Printer_1
config mdns profile service add default-mdns-profile HP_Photosmart_Printer_2
config mdns profile service add default-mdns-profile Printer
config mdns profile service add default-mdns-profile http_tcp_local
config mdns profile service add default-mdns-profile printer_extended
config mdns profile create default-mdns-profile
config mdns service origin all AirPrint
config mdns service query enable AirPrint
config mdns service create AirPrint _ipp._tcp.local. origin all lss disable query enable
config mdns service origin all AirTunes
config mdns service query enable AirTunes
config mdns service create AirTunes _raop._tcp.local. origin all lss disable query enable
config mdns service origin all AppleTV
config mdns service query enable AppleTV
config mdns service create AppleTV _airplay._tcp.local. origin all lss disable query enable
config mdns service origin all HP_Photosmart_Printer_1
config mdns service query enable HP_Photosmart_Printer_1
config mdns service create HP_Photosmart_Printer_1 _universal._sub._ipp._tcp.local. origin all lss disable query enable
config mdns service origin all HP_Photosmart_Printer_2
config mdns service query enable HP_Photosmart_Printer_2
config mdns service create HP_Photosmart_Printer_2 _cups._sub._ipp._tcp.local. origin all lss disable query enable
config mdns service origin all Printer
config mdns service query enable Printer
config mdns service create Printer _printer._tcp.local. origin all lss disable query enable
config mdns service origin all http_tcp_local
config mdns service query enable http_tcp_local
config mdns service create http_tcp_local _http._tcp.local. origin all lss disable query enable
config mdns service origin all printer_extended
config mdns service query enable printer_extended
config mdns service create printer_extended _printer._sub._http._tcp.local. origin all lss disable query enable
config mdns policy service-group user-role add default-mdns-policy admin
config mdns policy service-group create default-mdns-policy "Default Access Policy created by WLC"
config mdns snooping enable
config wlan avc 8 visibility enable
config wlan avc 10 visibility enable
config wlan ccx aironetiesupport disable 1
config wlan session-timeout 1 0
config wlan broadcast-ssid enable 1
config wlan ccx aironetiesupport disable 8
config wlan session-timeout 8 1800
config wlan broadcast-ssid disable 8
config wlan ccx aironetiesupport disable 10
config wlan session-timeout 10 1800
config wlan broadcast-ssid disable 10
config wlan interface 1 management
config wlan interface 8 management
config wlan interface 10 management
config wlan create 1 HSCDevices HSCDevices
config wlan create 8 847847 847847
config wlan dhcp_server 8 10.$SUBNET.1.20
config wlan create 10 PodProd PodProd
config wlan dhcp_server 10 10.$SUBNET.1.20
config wlan mfp client enable 1
config wlan mfp client enable 8
config wlan mfp client enable 10
config wlan radius_server acct add 8 3
config wlan radius_server acct interim-update disable 8
config wlan radius_server auth add 8 6
config wlan multicast interface 10 enable management
config wlan radius_server acct add 10 1
config wlan radius_server auth add 10 3
config wlan flexconnect local-switching 10 central-dhcp nat-pat disable
config wlan flexconnect local-switching 10 enable
config wlan security web-auth server-precedence 1 local radius ldap
config wlan security wpa akm psk set-key hex encrypt 1 0114c9a3eae44f593b854a23aef6fc63 ffd9baec12599e8bad3da2f2cebe5d983c66c079 48 1f6f749a081312f19f1bd9c5faf31e34a98eb26c0fe207f34fc494c2a9558ac3ee33847e7787ad80ab1ee095d3f47be500000000000000000000000000000000000000000000000000000000000000000000000a00000000153e2d4000000000000000010000000013d902800000000000000000000000002ad955a80000000015a80000000000001016140800000000 1
config wlan security wpa akm psk enable 1
config wlan security wpa akm 802.1x disable 1
config wlan security wpa wpa1 ciphers aes enable 1
config wlan security wpa wpa1 enable 1
config wlan security wpa enable 1
config wlan wmm allow 1
config wlan security web-auth server-precedence 8 local radius ldap
config wlan security 802.1x enable 8
config wlan security wpa akm 802.1x disable 8
config wlan security wpa wpa2 ciphers aes disable 8
config wlan security wpa wpa2 disable 8
config wlan security wpa disable 8
config wlan wmm allow 8
config wlan mdns profile 10 none
config wlan mdns disable 10
config wlan security web-auth server-precedence 10 radius
config wlan security wpa enable 10
config wlan wmm allow 10
config wlan exclusionlist 1 60
config wlan exclusionlist 8 60
config wlan exclusionlist 10 60
config wlan load-balance allow enable 10
config wlan band-select allow enable 10
config wlan enable 1
config wlan enable 8
config wlan enable 10
config ipv6 capwap udplite disable all
config ipv6 disable
config country US
config rfid timeout 1200
config rfid status enable
config rfid mobility pango disable
config sysname $SITE-WLC01
config snmp community ipaddr 10.1.31.48 255.255.255.255 mrhat_net
config snmp community ipaddr 10.1.33.0 255.255.255.0 mr_hay
config snmp community delete public
config snmp community delete private
config snmp community mode enable mrhat_net
config snmp community create mrhat_net
config snmp community mode enable mr_hay
config snmp community create mr_hay
config snmp syslocation Whitman
config snmp trapreceiver ipsec ike auth-mode certificate mr_hat
config snmp trapreceiver mode enable mr_hat
config snmp trapreceiver create mr_hat 10.1.31.48
config snmp syscontact Telecom/Peapod,LLC
config switchconfig strong-pwd lockout attempts mgmtuser 3
config switchconfig strong-pwd lockout time mgmtuser 5
config switchconfig flowcontrol enable
transfer download username customer
transfer download path /
transfer download serverip 10.1.33.124
transfer download filename GDP_WLC_FINAL_AT_SKOKIEv3_11_27_2017.conf
transfer download port 21
transfer download encrypt password 1 86cd5ed01040d909aadaa65505856c54 489b91b3ec0ea8fecf75e21f0ea39840067600a4 48 7a150fab5104257ffe0761e98abef8fe9d615c06b6d5a50cf9d65159a0a9f1a6091fbe551faa296108cd43ea4462c53b
transfer upload username customer
transfer upload path /
transfer upload serverip 10.1.33.124
transfer upload filename GDP_WLC_FINAL_AT_SKOKIEv3_11_27_2017.conf
transfer upload port 21
transfer upload encrypt password 1 86cd5ed01040d909aadaa65505856c54 489b91b3ec0ea8fecf75e21f0ea39840067600a4 48 7a150fab5104257ffe0761e98abef8fe9d615c06b6d5a50cf9d65159a0a9f1a6091fbe551faa296108cd43ea4462c53b
transfer upload datatype config
EOT
