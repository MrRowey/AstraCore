---
layout: default
title: Network Map
---

<h1 class="page-title">Network Map</h1>
<p class="page-subtitle">Visual overview of your homelab topology</p>

<div class="mermaid">
flowchart LR
  %% GLOBAL STYLES
  classDef network fill:#1e3a8a,stroke:#93c5fd,color:#fff,stroke-width:2px;
  classDef media fill:#7c2d12,stroke:#fdba74,color:#fff,stroke-width:2px;
  classDef photos fill:#065f46,stroke:#6ee7b7,color:#fff,stroke-width:2px;
  classDef ai fill:#4c1d95,stroke:#c4b5fd,color:#fff,stroke-width:2px;
  classDef monitor fill:#1f2937,stroke:#9ca3af,color:#fff,stroke-width:2px;
  classDef web fill:#7e22ce,stroke:#e9d5ff,color:#fff,stroke-width:2px;

  classDef offline stroke-dasharray: 5 5,stroke:#ef4444;
  classDef online stroke:#22c55e;

  %% SUBGRAPHS
  subgraph Network_Core[Network Core]
    node-1
  end

  subgraph Backup[Backup]
    node-2
  end

  subgraph Home_Automation[Home Automation]
    node-3
  end

  subgraph Media[Media]
    node-4
    node-8
  end

  subgraph Photos[Photos]
    node-5
  end

  subgraph Monitoring[Monitoring]
    node-6
  end

  subgraph WebApps[Web Apps]
    node-7
  end

  subgraph AI[AI]
    node-9
  end

  %% AUTO-GENERATED NODES
  {% for node in site.data.nodes %}
    {{ node.id }}["{{ node.name }}<br>{{ node.vm }}"]
  {% endfor %}

  %% AUTO-GENERATED CONNECTIONS
  {% for node in site.data.nodes %}
    {% if node.connections %}
      {% for target in node.connections %}
        {{ node.id }} --> {{ target }}
      {% endfor %}
    {% endif %}
  {% endfor %}

  %% ROLE-BASED COLORS
  class node-1 network;
  class node-2 network;
  class node-3 network;
  class node-4 media;
  class node-5 photos;
  class node-6 monitor;
  class node-7 web;
  class node-8 media;
  class node-9 ai;

  %% STATUS COLORS
  {% for node in site.data.nodes %}
    {% if node.status == "offline" %}
      class {{ node.id }} offline;
    {% else %}
      class {{ node.id }} online;
    {% endif %}
  {% endfor %}
</div>
