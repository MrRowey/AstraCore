# 🚀 AstraCore V1 — Unified Master Documentation

> **Project Vision:** AstraCore V1 is a 10‑node Proxmox‑based homelab designed for reliability, modularity, and clean separation of workloads[cite: 3]. All persistent data lives under `/opt/appdata/` until a NAS is deployed[cite: 3]. The domain is `astracore.me`, managed via Cloudflare[cite: 3].

---

## 🛑 Phase 0: Pre-Flight Checklist

Before deploying a single container, the following foundational steps must be completed to ensure cluster stability:

*   **Hardware Preparation:** Physically install the 16GB DDR3 RAM upgrades into `pve-ai`, `pve-media`, and `pve-photos`[cite: 9].
*   **BIOS Configuration:** Enable Intel Virtualization Technology (VT-x) and VT-d (IOMMU) on all nodes to support Proxmox and hardware passthrough[cite: 7]. Set power states to "Always On" or "Restore after AC Power Loss".
*   **Proxmox Clustering:** Install Proxmox on `pve-net` first, assigning static IP `192.168.1.10`[cite: 9]. Create the cluster here, then install and join the remaining 9 nodes[cite: 4].
*   **The "Golden" Ubuntu Template:** Build a single Ubuntu Server VM on `pve-net` equipped with Docker, Docker Compose, `qemu-guest-agent`, and the base `/opt/appdata/` and `/opt/stacks/` directories[cite: 1]. Convert this to a template to clone for all future service nodes.
*   **Secrets Management:** Add `.env` to the repository's `.gitignore` file to protect API keys and passwords[cite: 1, 8]. Commit `.env.example` files to maintain documentation[cite: 2, 8, 10].
*   **The "First Two" Deployment Rule:** Deploy `pve-net` (routing and security) first, immediately followed by `pve-backup` (automated backups)[cite: 4, 9]. No other workloads are deployed until these two are stable.

---

## 🖥️ 1. Final Architecture & Node Layout

The final configuration splits the workloads across 10 distinct nodes to ensure high availability and clean service separation[cite: 9].

### Hardware Specifications
*   **Service Nodes (x8):** Lenovo ThinkCentre M73 (i5-4570T, 2c/4t, 8GB DDR3, 120GB SSD)[cite: 9].
*   **Networking Node (x1):** Lenovo ThinkCentre M93 (i3-4130T, 2c/4t, 8GB DDR3, 120GB SSD)[cite: 9].
*   **Backup Node (x1):** Lenovo ThinkCentre M93 (i3-4130T, 2c/4t, 8GB DDR3, 2TB SSHD)[cite: 9].

### RAM Upgrade Priorities
*   **pve-ai (16GB):** Critical requirement to run 7B LLM models[cite: 9].
*   **pve-media (16GB):** High priority for Plex hardware transcoding headroom[cite: 9].
*   **pve-photos (16GB):** High priority for Immich Machine Learning processing[cite: 9].

### Cluster Layout
| Hostname | IP Address | Primary Role | Core Services |
| :--- | :--- | :--- | :--- |
| **pve-net** | `192.168.1.10` | Networking & Security[cite: 9] | AdGuard, Traefik, Cloudflare Tunnel, WireGuard, Authelia[cite: 9] |
| **pve-backup** | `192.168.1.11` | Backups[cite: 9] | Proxmox Backup Server (PBS VM)[cite: 9] |
| **pve-home** | `192.168.1.12` | Smart Home[cite: 9] | Home Assistant OS (VM), TP-Link Tapo[cite: 9] |
| **pve-media** | `192.168.1.13` | Media Server[cite: 9] | Plex, Sonarr, Radarr, Prowlarr, Overseerr[cite: 9] |
| **pve-photos** | `192.168.1.14` | Photos[cite: 9] | Immich (server + ML)[cite: 9] |
| **pve-monitor** | `192.168.1.15` | Monitoring & Docs[cite: 9] | Portainer, Prometheus, Grafana, Uptime Kuma, Gitea, NetBox[cite: 9], Loki, Diun |
| **pve-web** | `192.168.1.16` | Web Apps[cite: 9] | Rewards App, Postgres[cite: 9], Homepage |
| **pve-dl** | `192.168.1.17` | Downloads[cite: 9] | qBittorrent, Recyclarr[cite: 9] |
| **pve-ai** | `192.168.1.18` | AI Services[cite: 9] | Ollama, Open WebUI[cite: 9] |
| **pve-spare** | `192.168.1.19` | Warm Spare[cite: 9] | Future use or `pve-ai2` expansion[cite: 9] |

---

## ⚙️ 2. Core Operational Concepts

### The Storage Model (`/opt/appdata/`)
*   Until the NAS is deployed, all persistent configuration and data is stored on local SSDs under the `/opt/appdata/SERVICE` directory path[cite: 2].
*   This specific structure ensures predictable backups and simplifies the eventual migration to TrueNAS[cite: 2].

### The Backup & Disaster Recovery Strategy
*   The Proxmox Backup Server (PBS) runs as a dedicated VM (`192.168.1.25`)[cite: 4].
*   It is installed directly onto the 2TB SSHD, which houses both the Proxmox OS and the PBS datastore partition[cite: 4].
*   Backups use the `Snapshot` mode to ensure zero downtime for running VMs[cite: 4].
*   **Pre-Backup Database Dumps:** Nodes running databases (`pve-web`, `pve-monitor`, `pve-photos`) run a cron job at 01:50 AM to execute a `pg_dump`. This saves a clean `.sql` file to local storage immediately before PBS captures the full VM snapshot at 02:00 AM[cite: 4].

### The Networking Stack
*   **The Proxy Network:** Before deployment, a shared Docker network is established on each node via the `docker network create proxy` command[cite: 1]. Every web-facing container joins this network using `external: true`[cite: 1].
*   **Routing:** Traefik uses Docker labels to handle dynamic routing, such as directing `plex.astracore.me` to the Plex container[cite: 2].
*   **Security:** Cloudflare Tunnel ensures external access without requiring open router ports[cite: 2]. Authelia handles Single Sign-On (SSO) and protects services using a single Traefik middleware label[cite: 1].

---

## 🛠️ 3. Node Configuration & Service Integration

### pve-net (Networking Foundation)
*   Deploys AdGuard Home for local DNS blocking and network routing[cite: 1].
*   Traefik utilizes Let's Encrypt with a Cloudflare DNS challenge to store SSL certificates in `/opt/appdata/traefik/acme`[cite: 2].
*   WireGuard provides VPN access for trusted devices, utilizing port `51820/udp`[cite: 2].

### pve-home (Smart Home)
*   Runs a full Home Assistant Operating System (HAOS) inside a Proxmox VM to retain Supervisor and Add-on capabilities[cite: 6].
*   The TP-Link Tapo integration automatically discovers local smart devices directly over the LAN[cite: 6].

### pve-media & pve-dl (Media Automation)
*   **The Split Architecture:** `pve-dl` handles qBittorrent and Recyclarr, while `pve-media` hosts the primary viewing stack (Plex, Sonarr, Radarr)[cite: 9].
*   **The Phase 1 Bridge:** `pve-dl` exports its `/opt/appdata/downloads` directory via an NFS share, which `pve-media` mounts at `/mnt/downloads`[cite: 9]. This ensures Sonarr and Radarr can see the downloaded files and migrate them locally to `/opt/appdata/media/`[cite: 7].
*   **Deployment Order:** Deploy services strictly in this sequence: Prowlarr → Sonarr → Radarr → Plex → Overseerr[cite: 7].

### pve-photos (Media Backup)
*   Deploys Immich using the official `docker-compose.yml` to replace Google Photos[cite: 8].
*   Initial Machine Learning imports will consume 100% CPU on both cores for several hours[cite: 8].

### pve-monitor (Documentation & Telemetry)
*   **NetBox:** Serves as the authoritative source of truth, documenting IPs, VMs, devices, and future VLANs[cite: 9].
*   **Metrics Pipeline:** A Node Exporter container runs on every single node[cite: 2]. Prometheus, running on `pve-monitor`, scrapes these targets every 15 seconds[cite: 5].
*   **Centralized Logging:** Loki runs centrally on this node. A lightweight Promtail agent is deployed to every node in the cluster, pushing Docker container logs back to Loki.
*   **Visualizations:** Grafana draws dashboards exclusively from Prometheus data, utilizing community dashboard ID `1860`[cite: 5], and allows split-view queries of live Loki logs.
*   **Update Alerts:** Diun (Docker Image Update Notifier) monitors the stack without touching containers, pinging via Telegram when image updates are available to be manually merged via GitOps.

### pve-web & pve-ai (Custom Applications)
*   `pve-web` hosts the Homepage unified dashboard, giving family members a clean landing page for Overseerr, Immich, and internal tools.
*   `pve-web` also runs a custom Node.js/React Rewards application with a Postgres database backend[cite: 9].
*   `pve-ai` hosts Ollama and Open WebUI to provide a private, local LLM environment[cite: 9].

---

## 📦 4. Post-Launch: The NAS Migration Plan

When the centralized NAS arrives, data will be migrated off the individual ThinkCentre nodes using a standardized four-step procedure[cite: 9]:

1.  **Mount:** Map the NAS NFS share to the local node by editing `/etc/fstab`[cite: 9].
2.  **Sync:** Transfer local data via `rsync -av /opt/appdata/SERVICE/ /mnt/nas/configs/SERVICE/`[cite: 9].
3.  **Update:** Modify the specific `docker-compose.yml` volume paths to point to the new `/mnt/nas` destination[cite: 9].
4.  **Deploy:** Run `docker compose up -d SERVICE` to restart the container with its new storage backend[cite: 9].

---

## 💻 5. Repository & CI/CD Structure

The entire cluster is managed via an Infrastructure-as-Code (IaC) repository at `github.com/MrRowey/AstraCore`[cite: 9].

*   **Directory Layout:** Contains separated folders for `nodes/`, `configs/`, `scripts/`, and `docs/`[cite: 3].
*   **Offline Fallback:** `pve-monitor` runs an instance of Gitea, acting as an offline mirror in case GitHub goes down[cite: 5].
*   **Automation Actions:**
    *   `validate.yml` checks compose files for syntax errors upon pushing code[cite: 3].
    *   `deploy.yml` automatically SSHs into nodes and updates containers upon merging to the main branch[cite: 3].
    *   `rollback.yml` provides a manual trigger to revert a specific node to a prior configuration state[cite: 3].
