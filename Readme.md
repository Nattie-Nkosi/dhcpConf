# DHCP Network Configuration Project

## Overview

This project involves setting up a network with DHCP services across multiple subnets. The network consists of two routers (R1 and R2), two switches (SW1 and SW2), and two client PCs (PC1 and PC2).

## Network Topology

- Router R2 acts as the main DHCP server
- Router R1 acts as both a DHCP client and a DHCP relay agent
- Two subnets: 192.168.1.0/24 and 192.168.2.0/24
- WAN link between routers: 203.0.113.0/30

## Configuration Tasks

### 1. Configure DHCP Pools on R2

R2 needs to be set up with three DHCP pools:

#### POOL1 (192.168.1.0/24)

- Network: 192.168.1.0/24
- Reserved addresses: 1 to 10
- DNS: 8.8.8.8
- Domain: jeremysitlab.com
- Default Gateway: R1's interface IP

#### POOL2 (192.168.2.0/24)

- Network: 192.168.2.0/24
- Reserved addresses: 1 to 10
- DNS: 8.8.8.8
- Domain: jeremysitlab.com
- Default Gateway: R2's interface IP

#### POOL3 (203.0.113.0/30)

- Network: 203.0.113.0/30
- Reserved address: 1

### 2. Configure R1's G0/0 Interface as DHCP Client

Set R1's G0/0 interface to obtain an IP address via DHCP from R2.

### 3. Configure R1 as DHCP Relay Agent

Set up R1 to relay DHCP requests from the 192.168.1.0/24 subnet to R2.

### 4. Configure PC1 and PC2

Ensure both PCs are set to obtain IP addresses automatically via DHCP.

## Implementation Steps

1. Access R2 and configure the DHCP pools using the `ip dhcp pool` command.
2. On R1, configure the G0/0 interface with `ip address dhcp`.
3. Set up DHCP relay on R1 using the `ip helper-address` command.
4. Verify PC1 and PC2 network settings to ensure they're set for DHCP.

## Verification

After configuration:

1. Check IP address assignments on all devices.
2. Verify connectivity between PCs and across subnets.
3. Test DNS resolution and internet access if applicable.

## Troubleshooting

If issues arise:

- Verify DHCP pool configurations on R2
- Check R1's relay configuration
- Ensure no IP conflicts exist
- Verify physical connections and interface statuses

## Conclusion

This setup provides a centralized DHCP service for multiple subnets, demonstrating DHCP server configuration, DHCP client setup, and DHCP relay functionality in a multi-router environment.
