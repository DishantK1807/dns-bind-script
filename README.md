# dns-bind-script
This repository contains the script for installing a DNS Bind Server on an Ubuntu Machine.

## Steps for editing the files
-   Editing `named.conf.options` file
    1.  Add all the private IPs in the `acl "trusted"` tag. An example is mentioned in the file.
    2.  Next, under the `options` tag find the `listen-on` option and update it with the Private IP for the 
        primary DNS server.
    3.  If we have a secondary DNS server, we need to find the `allow-transfer` under the `options` tag and replace the `none` with the 
        Private IP address of the secondary DNS server.

- Editing the `named.conf.local` file
    - Configure Forward lookup zone
        1.  Next we need to do is update the DNS zones. `named.conf.local` already has the instructions to update for the forward and
            backward zone.
        2.  For configuring the forward zone, replace the `nyc3.example.com` under the forward zone with your subdomain.
        3.  Next, we need to update the filename wrt the subdomain and update the same under the `file` option under the zone.
        4.  If we have a secondary DNS server, we need to find the `allow-transfer` under the `options` tag and replace the `none`
            with the Private IP address of the secondary DNS server. Our forward zone is configured now.
    
    - Configure the Reverse loopup zone
        1.  Next we need to configure is our Reverse loopkup zone. Under the reverse zone change the `45.123` with the octet reversal
            of what your Private IP starts with. In the example the IP starts with `123.45`, the octet reversal for which is `45.123`
        2.  Next, we need to update the filename wrt the octet reversal IP and update the same under the `file` option under the zone.
        3.  If we have a secondary DNS server, we need to find the `allow-transfer` under the `options` tag and replace the `none`
            with the Private IP address of the secondary DNS server. Our reverse zone is configured now.

- Editing the Forward Zone file
    1.  The forward zone file will be of the name `db.nyc3.example.com`. We need to update the filename wrt our subdomain.
    2.  Update `ns1.nyc3.example.com` with the Private FQDN of the DNS server.
    3.  Update `nyc3.example.com` with the subdomain.
    4.  Under `name server - NS records` update with the DNS server name.
    5.  Under `name server - A records` update with the DNS Servers name and IP.
    6.  Under `host server - A records` update with the Host servers name and IP.

- Editing the Reverse Zone File
    1.  The reverse zone file will be of the name `db.45.123`. We need to update the filename wrt our octet reversal IP.
    2.  Update `ns1.nyc3.example.com` with the Private FQDN of the DNS server.
    3.  Update `nyc3.example.com` with the subdomain.
    4.  Under `name servers` update with DNS server name.
    5.  Under `PTR records` update with DNS and host servers name and IPs.

- Editing the `00-private-nameservers.yaml` file
    1.  Update the name of the private network interface.
    2.  Update the Private IP of the DNS server under `addresses`.
    3.  Update the subdomain under `search`.

- Editing the `script.sh` file
    1. Update the file paths for the respective files.


## Running the script

1.  Update the execution permission on the file using the following command.
        `sudo chmod +x script.sh`
2.  Run the script using the following command
        `./script.sh`
