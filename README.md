# 🚀 AstraCore

<p align="center">
  <img src="docs/Icon.png" alt="AstraCore Icon" width="160" />
</p>

*AstraCore is a sci‑fi inspired homelab cluster built on Proxmox and Docker, designed for virtualization, automation, and distributed systems.*

---

## 🧠 Overview
AstraCore is a multi-phase homelab project evolving from a distributed cluster into a centralised, enterprise-style infrastructure.

---

# ⚙️ Phase 1 — Current Setup (In Development)

> Active build and testing phase using distributed hardware

### 🖥️ Infrastructure
- 10-node ThinkCentre cluster (M73 / M93)
- Proxmox across multiple low-power nodes
- Docker workloads running in VMs

### 🧩 Core Stack
- **Virtualization:** Proxmox VE  
- **Containers:** Docker  
- **Storage:** TrueNAS (NFS)

### 🔧 Key Features
- Distributed compute across nodes  
- Containerised services (media, monitoring, networking)  
- Reverse proxy + remote access  
- Ongoing configuration and optimisation  

### 🎯 Purpose
- Learn clustering and distributed systems  
- Experiment with Docker workloads  
- Build a flexible and modular lab  

### 📌 Status
🚧 Actively being built, tested, and refined  

---

## 🚧 Phase 2 — Post-Move Upgrade (AstraCore V2)

> Full redesign after relocation — moving to a centralised, rack-based setup

### 🖥️ Planned Infrastructure
- Dell PowerEdge R610 (primary compute host)
- Rack-mounted TrueNAS system (12-bay storage)
- Cisco 48-port managed switch
- Sophos XG firewall

### ⚡ Improvements
- Centralised compute replacing multi-node cluster  
- VLAN segmentation (servers, IoT, guest, etc.)  
- Enterprise networking and security  
- Improved storage with ZFS + redundancy  
- Simplified power, cooling, and management  

### 🧩 Architecture
- Proxmox on main server  
- Docker workloads inside VMs  
- Shared storage via TrueNAS  
- Traffic managed through reverse proxy  
- Secure remote access via VPN  

### 🧠 Goals
- Increase performance and reliability  
- Reduce complexity and power usage  
- Build a production-style homelab  
- Introduce structured networking and security  

### 📌 Status
📝 Planned — will begin after relocation  

---

## 🔮 Project Vision
AstraCore represents a modular compute core — evolving from a learning cluster into a stable, scalable, and high-performance homelab platform.

---

## 🛠️ Overall Status
- 🚧 Phase 1: In Development  
- ⏳ Phase 2: Planned  

---

## 📡 Notes
This project is continuously evolving as new hardware, tools, and ideas are introduced.
