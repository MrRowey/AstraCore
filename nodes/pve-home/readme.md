# pve-home — Home Automation Node

This node hosts **Home Assistant OS** as a VM and provides monitoring + remote management via Docker.

## Services (Docker)
- **Node Exporter** — exposes metrics to Prometheus
- **Portainer Agent** — allows Portainer on pve-monitor to manage this node

## Deployment

Clone the repo on the node:

git clone https://github.com/MrRowey/AstraCore.git (github.com in Bing)
cd AstraCore/nodes/pve-home
cp .env.example .env
docker compose pull
docker compose up -d

Code

## Required directories
None — Home Assistant runs as a VM.

## Notes
- Keep this node lightweight to ensure HAOS has maximum resources.
- Node Exporter ensures full visibility in Grafana dashboards.