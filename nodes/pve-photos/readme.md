# pve-photos — Immich Photo Management Node

This node runs the full Immich stack, including machine learning, database, and Redis.

## Services
- **Immich Server** — main API + UI
- **Immich Machine Learning** — face detection, object recognition
- **Postgres** — Immich database
- **Redis** — caching + job queue
- **Node Exporter**
- **Portainer Agent**

## Deployment

git clone https://github.com/MrRowey/AstraCore
cd AstraCore/nodes/pve-photos
cp .env.example .env
nano .env
docker compose pull
docker compose up -d

Code

## Required directories

/opt/appdata/immich/photos
/opt/appdata/immich/config
/opt/appdata/immich/db
/opt/appdata/immich/ml

Code

## Notes
- ML container will use **100% CPU** during initial indexing — this is normal.
- Immich requires stable storage; avoid moving directories while running.
- Traefik handles HTTPS and Authelia handles authentication.