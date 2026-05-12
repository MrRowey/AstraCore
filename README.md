# 🚀 AstraCore

*AstraCore is a sci‑fi inspired homelab cluster built on Proxmox and Docker, designed for scalable virtualization, containerized workloads, and infrastructure testing.*

---

## 🧠 Overview
AstraCore is a personal lab environment used to explore and manage modern infrastructure, automation, and distributed systems across multiple nodes.

- **Hypervisor:** Proxmox VE  
- **Containers:** Docker (via VM hosts)  
- **Storage:** TrueNAS Scale (NFS shared storage)  
- **Nodes:** 10-node cluster

---

## ⚙️ Core Features
- Multi-node Proxmox cluster
- Containerized services via Docker
- Reverse proxy and secure remote access
- Centralised monitoring and logging
- Self-hosted applications and automation tools

---

## 🧩 Services
AstraCore runs a wide range of self-hosted services, including:

- **Networking:** AdGuard, WireGuard, Traefik  
- **Media:** Plex, Sonarr, Radarr, Overseerr  
- **Monitoring:** Grafana, Prometheus, Uptime Kuma  
- **Automation:** Home Assistant, Mosquitto  
- **Security:** Authelia (SSO)  
- **Dev Tools:** Gitea  
- **Storage & Backup:** TrueNAS, Proxmox Backup Server  

---

## 🌐 Architecture
- Docker containers run inside Proxmox VMs  
- Shared storage provided via NFS from TrueNAS  
- Traffic routed through Traefik with optional authentication via Authelia  
- Remote access handled via WireGuard and Cloudflare Tunnel  

---

## 🔮 Goals
- Learn and experiment with modern infrastructure  
- Build a scalable and resilient homelab platform  
- Host reliable self-hosted services for real-world use  

---

## 🛠️ Status
🚧 Active development and continuous improvement  

---

## 📡 Inspiration
Built as a personal "compute core" — AstraCore represents a modular, expandable system inspired by sci-fi AI and distributed networks.
