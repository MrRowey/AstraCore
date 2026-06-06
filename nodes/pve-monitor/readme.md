# pve-monitor — Observability & GitOps Node

This is the monitoring and management hub of AstraCore.

## Services
- **Portainer** — cluster management
- **Prometheus** — metrics collection
- **Grafana** — dashboards
- **Uptime Kuma** — service monitoring
- **Gitea** — internal Git server
- **NetBox** — network source of truth
- **Node Exporter**
- **Portainer Agent**

## Deployment

git clone https://github.com/MrRowey/AstraCore
cd AstraCore/nodes/pve-monitor
cp .env.example .env
nano .env
docker compose pull
docker compose up -d

Code

## Required directories

/opt/appdata/portainer
/opt/appdata/prometheus
/opt/appdata/grafana
/opt/appdata/uptime-kuma
/opt/appdata/gitea
/opt/appdata/netbox

Code

## Notes
- This node is the backbone of AstraCore observability.
- NetBox is fully integrated with Traefik + Authelia.
- Prometheus scrapes every node’s Node Exporter.
- Grafana dashboards auto‑populate once Prometheus is running.