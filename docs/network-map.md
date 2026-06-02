---
layout: default
title: Network Map
---

<div class="network-map-page fade-in">

  <h1 class="page-title">Network Map</h1>
  <p class="page-subtitle">Visual overview of nodes, services, and dependencies</p>

  <div class="network-diagram">
    {% for node in site.data.network.nodes %}
      <div class="network-node" id="{{ node.id }}">
        <h3>{{ node.name }}</h3>
        <p class="node-role">{{ node.role }}</p>

        <div class="node-services">
          {% for service in node.services %}
            <div class="service" data-service="{{ service }}">
              {{ site.data.network.services[service].label }}
            </div>
          {% endfor %}
        </div>
      </div>
    {% endfor %}
  </div>

</div>
