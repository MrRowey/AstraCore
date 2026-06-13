---
layout: node
id: node-5
---
{% assign node_id = page.id | split: "/" | last %}
{% assign node = site.data.nodes | where: "id", node_id | first %}

{% if node %}

  {% assign node_view = node %}

  {% include node-header.html node=node_view %}
  {% include node-overview.html node=node_view %}
  {% include spec-grid.html node=node_view %}

{% else %}
  <div class="node-error">
    <h2>Node not found</h2>
    <p>❌ Could not locate node with id: <code>{{ node_id }}</code></p>

    <p>Available nodes:</p>
    <ul>
      {% for n in site.data.nodes %}
        <li>{{ n.id }} — {{ n.name }}</li>
      {% endfor %}
    </ul>
  </div>
{% endif %}