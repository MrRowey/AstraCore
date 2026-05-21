---
layout: default
title: Home
description: "AstraCore homelab: Proxmox hosts, Docker, orchestration, and resilient services."
keywords: [proxmox, docker, homelab, infrastructure, pve]
permalink: /
---
<section class="hero" aria-labelledby="home-hero">
    <div class="hero-content">
        <p class="eyebrow">PROXMOX • CONTAINERS • DISTRIBUTED SYSTEMS</p>

        <h1 id="home-hero">AstraCore Infrastructure Cluster</h1>

        <p class="hero-text">A consolidated homelab platform for virtualization, container workloads, orchestration, and resilient services.</p>

        <div class="hero-buttons" role="navigation" aria-label="Hero quick actions">
                <a href="{{ '/nodes/' | relative_url }}" class="primary-btn">View Nodes</a>
                <a href="{{ '/configs/' | relative_url }}" class="secondary-btn">Configs</a>
                <a href="{{ site.github_repo }}" class="secondary-btn" target="_blank" rel="noopener noreferrer">GitHub Repository</a>
            </div>
    </div>
</section>

<section class="dashboard-grid">
    <div class="dashboard-card">
        <span class="card-label">Cluster Status</span>
        <h2>Operational</h2>
        <p>Distributed services online and synchronized.</p>
    </div>

    <div class="dashboard-card">
        <span class="card-label">Hypervisors</span>
        <h2>{{ site.data.nodes | size }} Active Nodes</h2>
        <p>Proxmox virtualization hosts and service nodes.</p>
    </div>

    <div class="dashboard-card">
        <span class="card-label">Container Stack</span>
        <h2>Docker + LXC</h2>
        <p>Microservices, automation, and internal tooling.</p>
    </div>

    <div class="dashboard-card">
        <span class="card-label">Quick Links</span>
        <h2>Explore</h2>
        <p>
            <a href="{{ '/nodes/' | relative_url }}">Nodes</a> ·
            <a href="{{ '/configs/' | relative_url }}">Configs</a> ·
            <a href="{{ '/scripts/' | relative_url }}">Scripts</a> ·
            <a href="{{ '/README.md' | relative_url }}">Contribute</a>
        </p>
    </div>
</section>

<footer class="page-meta">
    <p>Last updated: {{ site.time | date: "%Y-%m-%d" }}</p>
</footer>