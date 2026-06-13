# 🚀 AstraCore

<p align="center">
  <img src="docs/Icon.png" alt="AstraCore Icon" width="160" />
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Proxmox-E57000?style=for-the-badge&logo=proxmox&logoColor=white" alt="Proxmox" />
  <img src="https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white" alt="Docker" />
  <img src="https://img.shields.io/badge/TrueNAS-0095D5?style=for-the-badge&logo=truenas&logoColor=white" alt="TrueNAS" />
</p>

*AstraCore is a sci‑fi inspired homelab platform built on Proxmox and Docker, focused on virtualization, automation, and distributed systems.*

---

## 🧠 Overview

AstraCore is a multi-phase homelab project designed to evolve from a distributed, low-power cluster into a centralized, enterprise-style infrastructure. 

The project serves as both a learning platform and a production-style environment, enabling experimentation with modern infrastructure concepts such as virtualization, containerization, storage, and network architecture.

---

## ⚙️ Phase 1: Distributed Cluster

> **Status:** 🚧 *Actively being built, tested, and refined.* > *Active build and experimentation phase using modular, low-power hardware.*

### 🖥️ Infrastructure & Stack
- **Hardware:** 10-node ThinkCentre cluster (M73 / M93)
- **Virtualization:** Proxmox VE deployed across multiple nodes
- **Containers:** Docker workloads running within virtual machines
- **Storage:** TrueNAS (NFS)

### 🎯 Objectives & Features
- **Compute:** Distributed compute across multiple nodes with containerised workloads.
- **Access:** Reverse proxy for service exposure and VPN for secure remote management.
- **Goals:** Learn clustering concepts, build a flexible environment, and continuously optimize hardware.

### 📦 Hosted Services

*Core services running within AstraCore, categorized by function:*

| Category | Service | Description |
| :--- | :--- | :--- |
| **🌐 Networking & Security** | **AdGuard Home**<br>**Traefik**<br>**Cloudflare Tunnel**<br>**WireGuard**<br>**Authelia** | Network-wide DNS filtering & ad blocking<br>Reverse proxy and dynamic routing<br>Secure external access without port forwarding<br>VPN for secure remote connectivity<br>SSO / 2FA Authentication & access control |
| **🏠 Automation & IoT** | **Home Assistant OS**<br>**TP-Link Tapo** | Smart home platform<br>Device control and monitoring integration |
| **🎬 Media & Storage** | **Plex**<br>**Sonarr / Radarr**<br>**Prowlarr / Overseerr**<br>**Immich** | Media streaming server<br>Automated TV and Movie management<br>Indexer management & media request system<br>Self-hosted photo backup with AI/ML features |
| **📊 Monitoring & Dev** | **Portainer**<br>**Grafana / Prometheus**<br>**Uptime Kuma**<br>**Gitea** | Container management UI<br>Metrics collection, monitoring, and visualizations<br>Service uptime monitoring<br>Self-hosted Git service |
| **🤖 AI & Local LLM** | **Ollama**<br>**Open WebUI**<br>**pve-ai2** | Local LLM runtime<br>Web interface for AI interaction *(planned 16GB RAM upgrade)*<br>Secondary Ollama instance (dedicated AI node) |
| **🧰 Infrastructure & Utils** | **Proxmox Backup Server**<br>**PostgreSQL**<br>**qBittorrent / Recyclarr**<br>**Rewards App** | VM and container backups<br>Database backend<br>Downloading & automated media quality management<br>Internal/custom reward system |

---

## 🚧 Phase 2: AstraCore V2 

> **Status:** 📝 *Planned — transition will begin following relocation.* > *Full redesign transitioning to a centralized, rack-based architecture.*

### 🖥️ Planned Infrastructure & Architecture
- **Primary Compute:** Dell PowerEdge R610 running Proxmox VE
- **Storage:** Rack-mounted TrueNAS system (12-bay storage) providing shared ZFS-based storage
- **Networking:** Cisco 48-port managed switch & Sophos XG firewall
- **Workloads:** Docker workloads hosted within VMs, traffic routed via reverse proxy

### ⚡ Key Improvements & Goals
- **Consolidation:** Centralized compute replacing distributed, low-power nodes.
- **Networking:** Enterprise-grade security and VLAN segmentation (Servers, IoT, Guest, Management).
- **Resilience:** ZFS-based storage with high redundancy.
- **Efficiency:** Simplified power, cooling, and hardware management.
- **Outcome:** Transition from a learning cluster to a highly reliable, production-style homelab.

---

## 🔮 Project Vision

AstraCore represents a modular compute core, built to evolve over time.

The long-term goal is to create a scalable, stable, and high-performance homelab platform that mirrors real-world enterprise infrastructure while remaining flexible for ongoing experimentation and learning.

---

## 📡 Notes & Overall Status

- 🚧 **Phase 1:** In Development  
- ⏳ **Phase 2:** Planned  

*This project is continuously evolving as new hardware, tools, and ideas are introduced. Expect regular changes, improvements, and experimentation throughout its development.*
