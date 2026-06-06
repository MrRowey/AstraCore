---
layout: default
title: Network Map
---

<h1 class="page-title">Network Map</h1>
<p class="page-subtitle">Visual overview of your homelab topology</p>

<div class="mermaid">
flowchart LR

  %% ============================================
  %% GLOBAL STYLE DEFINITIONS
  %% ============================================

  %% Role-based color themes
  classDef network fill:#1e3a8a,stroke:#60a5fa,color:#fff,stroke-width:2px,rx:10,ry:10;
  classDef media fill:#9a3412,stroke:#fb923c,color:#fff,stroke-width:2px,rx:10,ry:10;
  classDef photos fill:#065f46,stroke:#34d399,color:#fff,stroke-width:2px,rx:10,ry:10;
  classDef ai fill:#4c1d95,stroke:#c084fc,color:#fff,stroke-width:2px,rx:10,ry:10;
  classDef monitor fill:#111827,stroke:#9ca3af,color:#fff,stroke-width:2px,rx:10,ry:10;
  classDef web fill:#6d28d9,stroke:#d8b4fe,color:#fff,stroke-width:2px,rx:10,ry:10;

  %% Status styles
  classDef offline stroke-dasharray: 6 4,stroke:#ef4444;
  classDef online stroke:#22c55e;

  %% ============================================
  %% SUBGRAPHS (GROUPS)
  %% ============================================

  subgraph Network_Core["🌐 Network Core"]
    node-1
  end

  subgraph Backup["💾 Backup"]
    node-2
  end

  subgraph Home_Automation["🏠 Home Automation"]
    node-3
  end

  subgraph Media["🎬 Media"]
    node-4
    node-8
  end

  subgraph Photos["📸 Photos"]
    node-5
  end

  subgraph Monitoring["📊 Monitoring"]
    node-6
  end

  subgraph WebApps["🌐 Web Apps"]
    node-7
  end

  subgraph AI["🤖 AI"]
    node-9
  end

  %% ============================================
  %% AUTO-GENERATED NODES (with icons + links)
  %% ============================================

  {% for node in site.data.nodes %}
    {{ node.id }}["<a href='/AstraCore/nodes/{{ node.id }}/' style='color:white;text-decoration:none;'>{{ node.name }}<br><span style='font-size:12px;'>{{ node.vm }}</span></a>"]
  {% endfor %}

  %% ============================================
  %% AUTO-GENERATED CONNECTIONS
  %% ============================================

  {% for node in site.data.nodes %}
    {% if node.connections %}
      {% for target in node.connections %}
        {{ node.id }} --> {{ target }}
      {% endfor %}
    {% endif %}
  {% endfor %}

  %% ============================================
  %% ROLE-BASED COLORS
  %% ============================================

  class node-1 network;
  class node-2 network;
  class node-3 network;
  class node-4 media;
  class node-5 photos;
  class node-6 monitor;
  class node-7 web;
  class node-8 media;
  class node-9 ai;

  %% ============================================
  %% STATUS COLORS
  %% ============================================

  {% for node in site.data.nodes %}
    {% if node.status == "offline" %}
      class {{ node.id }} offline;
    {% else %}
      class {{ node.id }} online;
    {% endif %}
  {% endfor %}
</div>
