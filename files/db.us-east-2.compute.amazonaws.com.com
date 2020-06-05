;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     ns1.nyc3.example.com. admin.nyc3.example.com. ( #Update here with Private FQDN and subdomain
                              3         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;

; name server - NS records
        IN      NS      ns1.nyc3.example.com.   #update with DNS server name

; name server - A records
ns1.nyc3.example.com.      IN      A       172.31.15.184        #Update with DNS server name and IP

; host server - A records       #Update with host servers name and IPs
host1.nyc3.example.com.      IN      A       172.31.35.196
host2.nyc3.example.com.      IN      A       172.31.43.221