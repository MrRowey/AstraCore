# pve-web — Rewards App Node

This node hosts the AstraCore Rewards App (backend + frontend) and its Postgres database.

## Services
- **Rewards API** — Node.js backend
- **Rewards Web** — React frontend
- **Postgres** — database for the app
- **Node Exporter**
- **Portainer Agent**

## Deployment

git clone https://github.com/MrRowey/AstraCore
cd AstraCore/nodes/pve-web
cp .env.example .env
nano .env
docker compose pull
docker compose up -d

Code

## Required directories

/opt/appdata/rewards/db

Code

## Notes
- The API and Web containers expect your Docker Hub images.
- Traefik + Authelia protect the frontend at:
  https://rewards.astracore.me
- Database credentials are stored in `.env`.