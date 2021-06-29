<h1>Pathways</h1>

<ul>
  {% for pw in site.pathways %}
    <li>
      <h3><a href="{{ pw.url }}">{{ pw.title }}</a></h3>
      <p>{{ pw.description }}</p>
    </li>
  {% endfor %}
</ul>
