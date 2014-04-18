---
layout: page
title: HOME
---
{% include JB/setup %}

<div class="row">
  {% for post in site.posts limit:3 %}
  <div class="span4">
    <a href="{{ BASE_PATH }}{{ post.url }}"><h2>{{ post.title }}</h2></a>
	<p>&nbsp;</p>
	<p>
	{{ post.content | strip_html | truncatewords:32 }}
	</p>
	<p>
	<a class="btn" href="{{ BASE_PATH }}{{ post.url }}">Read more...</a>
	</p>
  </div>
  {% endfor %}
</div>

