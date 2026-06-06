---
layout: node
id: node-2
---

{% assign node = site.data.nodes | where: "id", page.id | first %}

{% include node-header.html node=node %}
{% include node-overview.html node=node %}
{% include spec-grid.html node=node %}
