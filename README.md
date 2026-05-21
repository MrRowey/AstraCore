# 🚀 AstraCore

<p align="center">
  <img src="docs/Icon.png" alt="AstraCore Icon" width="160" />
</p>

*AstraCore is a sci‑fi inspired homelab platform built on Proxmox and Docker, focused on virtualization, automation, and distributed systems.*

---

## 🧠 Overview
AstraCore is a multi-phase homelab project designed to evolve from a distributed, low-power cluster into a centralized, enterprise-style infrastructure.

The project serves as both a learning platform and a production-style environment, enabling experimentation with modern infrastructure concepts such as virtualization, containerization, storage, and network architecture.

---

# ⚙️ Phase 1 — Distributed Cluster (In Development)

> Active build and experimentation phase using modular, low-power hardware

### 🖥️ Infrastructure
- 10-node ThinkCentre cluster (M73 / M93)
- Proxmox VE deployed across multiple nodes
- Docker workloads running within virtual machines

### 🧩 Core Stack
- **Virtualization:** Proxmox VE  
- **Containers:** Docker  
- **Storage:** TrueNAS (NFS)

## 📦 Service List

> Core services running within AstraCore, grouped by function

### 🌐 Networking & Security
- **AdGuard Home** — Network-wide DNS filtering & ad blocking  
- **Traefik** — Reverse proxy and dynamic routing  
- **Cloudflare Tunnel** — Secure external access without port forwarding  
- **WireGuard** — VPN for secure remote connectivity  
- **Authelia** — Authentication & access control (SSO / 2FA)  

---

### 🖥️ Infrastructure & Backup
- **Proxmox Backup Server** — VM and container backups  

---

### 🏠 Home Automation & IoT
- **Home Assistant OS** — Smart home platform  
- **TP-Link Tapo Integration** — Device control and monitoring  

---

### 🎬 Media & Content Automation
- **Plex** — Media streaming server  
- **Sonarr** — TV show management  
- **Radarr** — Movie management  
- **Prowlarr** — Indexer management  
- **Overseerr** — Media request system  

---

### 📷 Media & Storage
- **Immich (Server + Machine Learning)** — Self-hosted photo backup with AI features  

---

### 📊 Monitoring, Dev & Management
- **Portainer** — Container management UI  
- **Grafana** — Metrics dashboards & visualisation  
- **Prometheus** — Metrics collection & monitoring  
- **Uptime Kuma** — Service uptime monitoring  
- **Gitea** — Self-hosted Git service  

---

### 🧰 Utilities & Supporting Services
- **Rewards App** — Internal/custom reward system  
- **PostgreSQL** — Database backend  
- **qBittorrent** — Download client  
- **Recyclarr** — Automated media quality management  

---

### 🤖 AI & Local LLM
- **Ollama** — Local LLM runtime  
- **Open WebUI** — Web interface for AI interaction *(planned upgrade to 16GB RAM)*  

---

### 🔮 Future Expansion
- **pve-ai2** — Secondary Ollama instance (dedicated AI node)  
- **Future Use / Overflow** — Reserved capacity for experimentation and scaling  
### 🔧 Key Features
- Distributed compute across multiple nodes
- Containerised workloads (media, monitoring, networking)
- Reverse proxy for service exposure
- Remote access and management
- Continuous optimisation and tuning

### 🎯 Objectives
- Learn clustering and distributed infrastructure concepts
- Experiment with containerised workloads
- Build a modular and flexible homelab environment

### 📌 Status
🚧 Actively being built, tested, and refined

---

## 🚧 Phase 2 — AstraCore V2 (Planned Upgrade)

> Full redesign following relocation — transitioning to a centralized, rack-based architecture

### 🖥️ Planned Infrastructure
- Dell PowerEdge R610 (primary compute host)
- Rack-mounted TrueNAS system (12-bay storage)
- Cisco 48-port managed switch
- Sophos XG firewall

### ⚡Key Improvements
- Centralised compute replacing distributed nodes
- VLAN segmentation (servers, IoT, guest, management)
- Enterprise-grade networking and security
- ZFS-based storage with redundancy
- Simplified power, cooling, and hardware management

### 🧩 Architecture
- Proxmox deployed on primary server
- Docker workloads hosted within VMs
- Shared storage provided via TrueNAS
- Reverse proxy managing traffic routing
- Secure remote access via VPN

### 🧠 Goals
- Improve performance and system reliability
- Reduce operational complexity and power consumption
- Transition to a production-style homelab
- Implement structured networking and security practices

### 📌 Status
📝 Planned — will begin after relocation  

---

## 🔮 Project Vision
AstraCore represents a modular compute core, built to evolve over time.

The long-term goal is to create a scalable, stable, and high-performance homelab platform that mirrors real-world enterprise infrastructure while remaining flexible for experimentation and learning.

---

## 🛠️ Overall Status
- 🚧 Phase 1: In Development  
- ⏳ Phase 2: Planned  

---

## 📡 Notes
This project is continuously evolving as new hardware, tools, and ideas are introduced.
Expect regular changes, improvements, and experimentation throughout its development.
