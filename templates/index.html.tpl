{% include "header.html" %}
<h1>List of running instances</h1>
<table class="table table-bordered table-striped">
  <thead>
    <tr class="mx-auto">
      <th scope="col">Instance name</th>
      <th scope="col">Launch Time</th>
    </tr>
  </thead>
  <tbody>
  {% for instance in instances_names %}
    <tr>
      <td>{{instance[0]}}</td>
      <td>{{instance[1]}}</td>
    </tr>
    {% endfor %}
  </tbody>
</table>

{% include "footer.html" %}