---
layout: node
id: node-7
---


{% assign node_id = page.id | split: "/" | last %}

{% assign node = nil %}
{% for n in site.data.nodes %}
  {% if n.id == node_id %}
    {% assign node = n %}
  {% endif %}
{% endfor %}

{% if node %}

  {% include node-header.html node=node %}
  {% include node-overview.html node=node %}
  {% include spec-grid.html node=node %}

{% else %}
  <p>❌ Node not found: {{ node_id }}</p>
{% endif %}