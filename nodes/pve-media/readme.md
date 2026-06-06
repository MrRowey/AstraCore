# pve-media — Media Automation Node

This node runs the entire media automation pipeline for AstraCore.

## Services
- **Plex** — media server
- **Sonarr** — TV automation
- **Radarr** — movie automation
- **Prowlarr** — indexer manager
- **Overseerr** — request portal
- **Node Exporter**
- **Portainer Agent**

## Deployment

git clone https://github.com/MrRowey/AstraCore
cd AstraCore/nodes/pve-media
cp .env.example .env
nano .env
docker compose pull
docker compose up -d

Code

## Required directories

/opt/appdata/plex
/opt/appdata/sonarr
/opt/appdata/radarr
/opt/appdata/prowlarr
/opt/appdata/overseerr
/opt/appdata/media/tv
/opt/appdata/media/movies
/mnt/downloads   (NFS mount from pve-dl)

Code

## Notes
- Plex uses Intel QuickSync via `/dev/dri`.
- Sonarr/Radarr expect downloads from `pve-dl` via NFS.
- Overseerr integrates with Plex + Sonarr + Radarr.