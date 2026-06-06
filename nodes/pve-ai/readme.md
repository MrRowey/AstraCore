# pve-ai — Local AI Node

This node provides AstraCore with on-prem AI capabilities using Ollama and Open WebUI.

## Services
- **Ollama** — model runtime (Llama, Mistral, etc.)
- **Open WebUI** — web interface for interacting with models
- **Node Exporter**
- **Portainer Agent**

## Deployment

git clone https://github.com/MrRowey/AstraCore
cd AstraCore/nodes/pve-ai
cp .env.example .env
nano .env
docker compose pull
docker compose up -d

Code

## Required directories

/opt/appdata/ollama
/opt/appdata/open-webui

Code

## Notes
- Models are stored in `/opt/appdata/ollama`.
- You can pull models with:
docker exec ollama ollama pull llama3.2:3b

Code
- Open WebUI is available at:
https://ai.astracore.me