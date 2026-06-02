---
layout: node
name: Heimdall
vm: PVE-Net
status: Offline

role:
    - AdGuard Home
    - Traefik
    - Cloudflare Tunnel
    - WireGuard
    - Authelia

description: >
    This node provides core network services. AdGuard Home filters ads and trackers at the DNS level, Traefik manages reverse proxying and TLS, Cloudflare Tunnel securely exposes services without port forwarding, WireGuard enables encrypted remote access, and Authelia adds multi-factor authentication for protected services.

device:
    ip: 192.168.1.10
    cpu: Intel Core i5-4570T
    memeory: 8Gb
    storage: 120gb SSD
---