---
layout: default
title: Nodes
permalink: /nodes/
---
 
<section>

  <div class="section-header">
    <h1>Infrastructure Nodes</h1>
    <p>Cluster-wide overview of virtualization and service systems.</p>
  </div>

 <div class="node-grid">
    {% for node in site.nodes %}

        <a href="{{ node.url | relative_url }}" class="node-card">
            <div class="node-card-top">
                <h2>{{ node.title }}</h2>
                <span class="status-badge {{ node.status | downcase }}">
                    {{ node.status }}
                </span>
            </div>
            <p class="node-role">{{ node.role }}</p>
            <p class="node-description">
                {{ node.description }}
            </p>
        </a>
    {% endfor %}
  </div>
</section>
