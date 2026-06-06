---
layout: node
id: node-1
---

{% assign node = site.data.nodes | where: "id", page.id | first %}

{% include node-header.html node=node %}
{% include node-overview.html node=node %}
{% include spec-grid.html node=node %}
