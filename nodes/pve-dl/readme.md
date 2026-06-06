md
# pve-backup — Proxmox Backup Node

This node hosts the **Proxmox Backup Server (PBS)** VM and provides monitoring + remote management via Docker.

## Services (Docker)
- **Node Exporter** — exposes metrics to Prometheus
- **Portainer Agent** — allows Portainer on pve-monitor to manage this node

## Deployment

Clone the repo on the node:

git clone https://github.com/MrRowey/AstraCore.git (github.com in Bing)
cd AstraCore/nodes/pve-backup
cp .env.example .env
docker compose pull
docker compose up -d

Code

## Required directories
No special directories required — PBS runs as a VM.

## Notes
- PBS VM should be configured in Proxmox with datastore on the 2TB SSHD.
- This node intentionally runs a minimal Docker stack.