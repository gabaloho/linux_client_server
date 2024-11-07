This is the setup for each network service on the server, including DHCP, DNS, and Nginx. Each section should focus on configuring and testing one service.

#### Content:

**DHCP Server Configuration:** Install and configure ISC DHCP server for automatic IP address assignment.
**DNS Server Configuration (BIND):** Install and configure BIND to provide DNS resolution for internal and external addresses.
**Nginx Web Server Configuration:** Install Nginx and configure a simple webpage for local access.
#### 3. **Services Configuration**
   - **DHCP (ISC DHCP Server)**:
     ```bash
     sudo apt install isc-dhcp-server
     sudo nano /etc/dhcp/dhcpd.conf
     ```
     Add the following to configure IP allocation:
     ```plaintext
     subnet 172.16.249.0 netmask 255.255.255.0 {
         range 172.16.249.10 172.16.249.50;
         option routers 172.16.249.1;
         option domain-name-servers 172.16.249.128;
         option domain-name "bookstore.local";
     }
     ```
     Restart DHCP service:
     ```bash
     sudo systemctl restart isc-dhcp-server
     ```
   - **DNS (BIND)**:
     ```bash
     sudo apt install bind9
     sudo nano /etc/bind/named.conf.options
     ```
     Configure forwarders:
     ```plaintext
     options {
         directory "/var/cache/bind";
         forwarders { 8.8.8.8; 8.8.4.4; };
         allow-query { any; };
         recursion yes;
         dnssec-validation auto;
     };
     ```
     Create forward zone:
     ```bash
     sudo nano /etc/bind/named.conf.local
     ```
     Add:
     ```plaintext
     zone "bookstore.local" IN {
         type master;
         file "/etc/bind/forward.bookstore.local.db";
     };
     ```
     Create forward zone file:
     ```bash
     sudo nano /etc/bind/forward.bookstore.local.db
     ```
     Add records:
     ```plaintext
     @       IN      SOA     ns.bookstore.local. admin.bookstore.local. (
                             1     ; Serial
                             604800 ; Refresh
                             86400  ; Retry
                             2419200; Expire
                             604800 ); Negative Cache TTL
     @       IN      NS      ns.bookstore.local.
     ns      IN      A       172.16.249.128
     www     IN      A       172.16.249.128
     ```
     Restart BIND:
     ```bash
     sudo systemctl restart bind9
     ```
###Nginx Web Server Setup
**Install Nginx**
```bash
sudo apt install nginx
  ```
Start and enable the Nginx service:
```bash
sudo systemctl start nginx
sudo systemctl enable nginx
 ```
###Create a simple HTML page for the demo:
```bash
sudo nano /var/www/html/index.html
 ```
**Example content:**
<html>
<body>
    <h1>Welcome to the Local Library’s Website</h1>
    <p>This is a demo page hosted on our internal server.</p>
</body>
</html>
