## backend-crud-api-with-restify
# Run The App
To run the app you can use 
<pre>node app.js</pre>
or
<pre>npm run dev</pre>
# API URL:
<h3>POST</h3>
<pre>localhost:5001/api/auth</pre>
note: to get the header authorization token
<ul>
  <li>email: kevin@gmail.com</li>
  <li>password: admin</li>
</ul>

<h3>GET</h3>
<pre>localhost:5001/api/checklists</pre>
or using query parameter
<pre>localhost:5001/api/checklists?limit=10&offset=0&sort=desc</pre>

<h3>GET</h3>
<pre>localhost:5001/api/checklists/:id</pre>

<h3>POST</h3>
<pre>localhost:5001/api/checklists</pre>
<ul>
  <li>object_domain: test</li>
  <li>object_id: 1</li>
  <li>description: Need to verity this guy house</li>
  <li>is_completed: false</li>
  <li>urgency: 0</li>
</ul>

<h3>PATCH</h3>
<pre>localhost:5001/api/checklists/:id</pre>
<ul>
  <li>object_domain: test</li>
  <li>object_id: 1</li>
  <li>description: Need to verity this guy house</li>
  <li>is_completed: false</li>
  <li>urgency: 0</li>
</ul>

<h3>DELETE</h3>
<pre>localhost:5001/api/checklists/:id</pre>
