Issue
----

HTTP(s) requests take a lot of time to load, after disconnecting from VPN connection

I'm using networkmanager-pptp for having the ability to use PPTP VPN with networkmanager

I didn't had time to investigate it more in depth, to know for sure what's actually taking time to load SSL handshake, first response, etc

Solution
----

A quick solution is to disconnect from network, in my case it was wireless, so I just disconnect from the wireless network and reconnect 
back to it
