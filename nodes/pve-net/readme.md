# pve-net — Networking Node

## Services
- Traefik (reverse proxy)
- Authelia (SSO)
- Cloudflare Tunnel (no open ports)
- AdGuard Home (DNS)
- WireGuard VPN
- Redis + Postgres (Authelia backend)
- Node Exporter
- Portainer Agent

## Deployment

docker compose pull
docker compose up -d


## Required directories

/opt/appdata/traefik
/opt/appdata/adguard
/opt/appdata/authelia
/opt/appdata/wireguard


## Notes
- This node controls all HTTPS routing.
- All services across AstraCore must join the `proxy` network.
