#!/bin/bash

# DHCP Network Configuration Script

# Configure R2 (DHCP Server)
configure_r2() {
    echo "Configuring R2 (DHCP Server)..."
    
    # Enter configuration mode
    echo "enable"
    echo "configure terminal"
    
    # Configure POOL1 (192.168.1.0/24)
    echo "ip dhcp pool POOL1"
    echo "network 192.168.1.0 255.255.255.0"
    echo "dns-server 8.8.8.8"
    echo "domain-name jeremysitlab.com"
    echo "default-router 192.168.1.1"
    echo "ip dhcp excluded-address 192.168.1.1 192.168.1.10"
    echo "exit"
    
    # Configure POOL2 (192.168.2.0/24)
    echo "ip dhcp pool POOL2"
    echo "network 192.168.2.0 255.255.255.0"
    echo "dns-server 8.8.8.8"
    echo "domain-name jeremysitlab.com"
    echo "default-router 192.168.2.1"
    echo "ip dhcp excluded-address 192.168.2.1 192.168.2.10"
    echo "exit"
    
    # Configure POOL3 (203.0.113.0/30)
    echo "ip dhcp pool POOL3"
    echo "network 203.0.113.0 255.255.255.252"
    echo "ip dhcp excluded-address 203.0.113.1"
    echo "exit"
    
    # Exit configuration mode
    echo "end"
    echo "write memory"
}

# Configure R1 (DHCP Client and Relay)
configure_r1() {
    echo "Configuring R1 (DHCP Client and Relay)..."
    
    # Enter configuration mode
    echo "enable"
    echo "configure terminal"
    
    # Configure G0/0 as DHCP client
    echo "interface GigabitEthernet0/0"
    echo "ip address dhcp"
    echo "no shutdown"
    echo "exit"
    
    # Configure DHCP relay on interface connected to 192.168.1.0/24
    echo "interface GigabitEthernet0/1"
    echo "ip helper-address 203.0.113.2"
    echo "exit"
    
    # Exit configuration mode
    echo "end"
    echo "write memory"
}

# Main execution
echo "Starting DHCP Network Configuration..."
configure_r2
echo ""
configure_r1
echo ""
echo "Configuration complete. Please verify settings."